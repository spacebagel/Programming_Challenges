import * as THREE from 'three';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';

const scene = new THREE.Scene();

const textureLoader = new THREE.TextureLoader()
const texture = textureLoader.load('src/texture.jpg');

const cubeGeometry = new THREE.BoxGeometry(1, 1, 1)
const cubeMaterial = new THREE.MeshBasicMaterial()
cubeMaterial.map = texture

const cubeMesh = new THREE.Mesh(
  cubeGeometry,
  cubeMaterial
)
scene.add(cubeMesh)

const camera = new THREE.PerspectiveCamera(
  30,
  window.innerWidth / window.innerHeight,
  0.1,
  30)

camera.position.z = 5
camera.position.y = 2

const canvas = document.querySelector('canvas.threejs')
const renderer = new THREE.WebGLRenderer({
  canvas: canvas
})
renderer.setSize(window.innerWidth, window.innerHeight)

const controls = new OrbitControls(camera, canvas)
controls.enableDamping = true
controls.autoRotate = true

const renderLoop = () => {
  controls.update()
  renderer.render(scene, camera)
  window.requestAnimationFrame(renderLoop)
}

renderLoop()