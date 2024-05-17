#!/bin/bash

# This file will be sourced in init.sh

# https://raw.githubusercontent.com/ai-dock/comfyui/main/config/provisioning/animated.sh
printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
function download() {
    wget -q --show-progress -e dotbytes="${3:-4M}" -O "$2" "$1"
}

## Set paths
nodes_dir=/opt/ComfyUI/custom_nodes
models_dir=/opt/ComfyUI/models
checkpoints_dir=${models_dir}/checkpoints
vae_dir=${models_dir}/vae
controlnet_dir=${models_dir}/controlnet/T2I-Adapter
loras_dir=${models_dir}/loras
upscale_dir=${models_dir}/upscale_models

### Install custom nodes
### Download controlnet

## example

#model_file=${controlnet_dir}/control_canny-fp16.safetensors
#model_url=https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_canny-fp16.safetensors

CONTROLNET_MODELS=(
    #format "local file, url download"
    "${controlnet_dir}/t2i-adapter-lineart-sdxl-1.0.safetensors, https://huggingface.co/TencentARC/t2i-adapter-lineart-sdxl-1.0/resolve/main/diffusion_pytorch_model.safetensors"
    "${controlnet_dir}/t2i-adapter-canny-sdxl-1.0.safetensors, https://huggingface.co/TencentARC/t2i-adapter-canny-sdxl-1.0/resolve/main/diffusion_pytorch_model.safetensors"
    "${controlnet_dir}/t2i-adapter-sketch-sdxl-1.0.safetensors, https://huggingface.co/TencentARC/t2i-adapter-sketch-sdxl-1.0/resolve/main/diffusion_pytorch_model.safetensors"
    "${controlnet_dir}/t2i-adapter-depth-midas-sdxl-1.0.safetensors, https://huggingface.co/TencentARC/t2i-adapter-depth-midas-sdxl-1.0/resolve/main/diffusion_pytorch_model.safetensors"
    "${controlnet_dir}/t2i-adapter-depth-zoe-sdxl-1.0.safetensors, https://huggingface.co/TencentARC/t2i-adapter-depth-zoe-sdxl-1.0/resolve/main/diffusion_pytorch_model.safetensors"
    "${controlnet_dir}/t2i-adapter-openpose-sdxl-1.0.safetensors, https://huggingface.co/TencentARC/t2i-adapter-openpose-sdxl-1.0/resolve/main/diffusion_pytorch_model.safetensors" 
)

function provisioning_get_controlnet() {
    for CONTROLNET in "${CONTROLNET_MODELS[@]}"; do
        # Extract server name and IP address using awk
        FileName=$(echo "$CONTROLNET" | awk -F', ' '{ print $1 }')
        FileURL=$(echo "$CONTROLNET" | awk -F', ' '{ print $2 }')
        
        # Print the server name and IP address
        #echo "File Name: $FileName, File Url Address: $FileURL"
    
        if [[ ! -e ${FileName} ]]; then
            printf "Downloading ${FileName}...\n"
            download ${FileURL} ${FileName}
        fi
    done
}

provisioning_get_controlnet

