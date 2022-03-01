<template>
  <v-container>
    <v-row>
      <v-col xs="12" sm="12" md="4">
        <v-row>
          <v-col cols="12">
            <v-card>
              <v-card-text>
                <v-text-field v-model="callId" label="Call ID" required />
              </v-card-text>
              <v-card-actions>
                <v-btn color="success" @click="callByName" class="px-4"><v-icon>mdi-phone</v-icon>Call</v-btn>
                <v-btn color="error" @click="close"> <v-icon>mdi-phone-off</v-icon>Close</v-btn>
              </v-card-actions>
            </v-card>
          </v-col>
          <v-col cols="12">
            <v-card>
              <v-card-title>
                自分のID: {{ this.peerId }}
              </v-card-title>
              <v-card-text>
                <video id="my-video" muted="true" width="340px" autoplay playsinline controls />
              </v-card-text>
              <v-card-actions>
                <!-- <v-row>
                  <v-col>
                    <v-select
                      v-model="selectedAudio"
                      :items="audios"
                      label="Audio input"
                      single-line
                      prepend-icon="mdi-microphone"
                      autofocus
                      dense
                      style="width: 350px"
                      @change="onChange"
                    />
                  </v-col>
                  <v-col>
                    <v-select
                      v-model="selectedVideo"
                      :items="videos"
                      label="Video input"
                      single-line
                      prepend-icon="mdi-video"
                      dense
                      style="width: 350px"
                      @change="onChange"
                    />
                  </v-col>
                </v-row> -->
              </v-card-actions>
            </v-card>
          </v-col>
        </v-row>
      </v-col>
      <v-col xs="12" sm="12" md="8">
        <v-card v-if="existingCall">
          <v-card-title> 通話相手: {{ existingCall.remoteId }} </v-card-title>
          <dir v-if="$vuetify.breakpoint.mdAndUp">
            <v-card-text>
              <video id="their-video" autoplay playsinline controls />
            </v-card-text>
          </dir>
          <div v-else>
            <v-card-text>
              <video id="their-video" width="340px" autoplay playsinline controls />
            </v-card-text>
          </div>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import Peer from 'skyway-js';

export default {
  data() {
    return {
      peer: {},
      peerId: null,
      callId: null,
      localStream: null,
      call: null,
      existingCall: null,
      audios: [],
      videos: [],
      selectedAudio: '', 
      selectedVideo: '',
      deviceInfos: null
    };
  },
  mounted: async function () {
    this.peer = new Peer({
      key: process.env.VUE_APP_SKYWAY_KEY,
      debug: 3,
    });

    this.peer.on('open', () => {
      this.peerId = this.peer.id;
    });

    this.peer.on('call', (call) => {
      this.call = call;
      call.answer(this.localStream);
      this.receive(call);
    });

    this.peer.on('close', () => {
      this.close();
    });
    this.peer.on('error', () => {
      this.close();
    });
    this.peer.on('disconnected', () => {
      this.close();
  
    });

    // this.deviceInfos = await navigator.mediaDevices.enumerateDevices();
    // this.deviceInfos
    //   .filter(deviceInfo => deviceInfo.kind === 'audioinput')
    //   .map(audio => this.audios.push({text: audio.label || `Microphone ${this.audios.length + 1}`, value: audio.deviceId}));
    // this.deviceInfos
    //   .filter(deviceInfo => deviceInfo.kind === 'videoinput')
    //   .map(video => this.videos.push({text: video.label || `Camera  ${this.videos.length - 1}`, value: video.deviceId}));

    // カメラ映像取得
    navigator.mediaDevices
      .getUserMedia({ video: true, audio: true })
      .then((stream) => {
        // 成功時にvideo要素にカメラ映像をセットし、再生
        const videoElm = document.getElementById('my-video');
        videoElm.srcObject = stream;
        videoElm.play();
        // 着信時に相手にカメラ映像を返せるように、グローバル変数に保存しておく
        this.localStream = stream;
      })
      .catch((error) => {
        // 失敗時にはエラーログを出力
        console.error('mediaDevice.getUserMedia() error:', error);
        return;
      });
  },
  methods: {
    callByName() {
      this.receive(this.peer.call(this.callId, this.localStream));
    },
    receive(call) {
      call.on('stream', (stream) => {
        const el = document.getElementById('their-video');
        el.srcObject = stream;
        el.play();
      });
      this.existingCall = call;
    },
    close() {
      if (this.existingCall) {
        this.existingCall.close()
        this.existingCall = null
      }
    },
    onChange: function (){
            if(this.selectedAudio != '' && this.selectedVideo != ''){
                this.connectLocalCamera();
            }
        },
        connectLocalCamera: async function (){
            const constraints = {
                audio: this.selectedAudio ? { deviceId: { exact: this.selectedAudio } } : false,
                video: this.selectedVideo ? { deviceId: { exact: this.selectedVideo } } : false
            }

            const stream = await navigator.mediaDevices.getUserMedia(constraints);
            document.getElementById('my-video').srcObject = stream;
            this.localStream = stream;
        }
  },
};
</script>
