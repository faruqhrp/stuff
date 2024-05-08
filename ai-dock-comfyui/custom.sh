#!/bin/bash

# This file will be sourced in init.sh

# https://raw.githubusercontent.com/ai-dock/comfyui/main/config/provisioning/default.sh

# Packages are installed after nodes so we can fix them...
# "${WORKSPACE}/storage/stable_diffusion/models/ckpt"
models_dir="${WORKSPACE}/storage/stable_diffusion/models"
custom_nodes_dir=/opt/ComfyUI/custom_nodes

checkpoints_dir=${models_dir}/ckpt
vae_dir=${models_dir}/vae
loras_dir=${models_dir}/lora
upscale_dir=${models_dir}/upscale_models
controlnet_dir=${models_dir}/controlnet
clip_vision_dir=${models_dir}/clip_vision
esrgan_dir=${models_dir}/esrgan
#ipadapter_dir=${models_dir}/ipadapter
#instantid_dir=${models_dir}/instantid

PYTHON_PACKAGES=(
    #"opencv-python==4.7.0.72"
)

NODES=(
    "https://github.com/ltdrdata/ComfyUI-Manager"
    "https://github.com/cubiq/ComfyUI_InstantID"
    #"https://github.com/SeargeDP/SeargeSDXL"
    "https://github.com/cubiq/ComfyUI_IPAdapter_plus"
)

CHECKPOINT_MODELS=(
    "https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt"
    #"https://huggingface.co/stabilityai/stable-diffusion-2-1/resolve/main/v2-1_768-ema-pruned.ckpt"
    #"https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors"
    #"https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors"
    "https://huggingface.co/RichVip/Cute_RichStyle_1.5/resolve/main/cbzbb_step_6000.ckpt"
    "https://huggingface.co/Lykon/dreamshaper-xl-v2-turbo/resolve/main/DreamShaperXL_Turbo_V2-SFW.safetensors"
    "https://huggingface.co/RunDiffusion/Juggernaut-X-Hyper/resolve/main/JuggernautXRundiffusion_Hyper.safetensors"
)

LORA_MODELS=(
    #"https://civitai.com/api/download/models/16576"
    "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sd15_lora.safetensors"
    "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sd15_lora.safetensors"
    "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sdxl_lora.safetensors"
    "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sdxl_lora.safetensors"
)

VAE_MODELS=(
    "https://huggingface.co/stabilityai/sd-vae-ft-ema-original/resolve/main/vae-ft-ema-560000-ema-pruned.safetensors"
    "https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors"
    "https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors"
)

ESRGAN_MODELS=(
    "https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x4.pth"
    "https://huggingface.co/FacehugmanIII/4x_foolhardy_Remacri/resolve/main/4x_foolhardy_Remacri.pth"
    "https://huggingface.co/Akumetsu971/SD_Anime_Futuristic_Armor/resolve/main/4x_NMKD-Siax_200k.pth"
)

CONTROLNET_MODELS=(
    "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_canny-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_depth-fp16.safetensors"
    "https://huggingface.co/kohya-ss/ControlNet-diff-modules/resolve/main/diff_control_sd15_depth_fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_hed-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_mlsd-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_normal-fp16.safetensors"
    "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_openpose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_scribble-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_seg-fp16.safetensors"
    "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_canny-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_color-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_depth-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_keypose-fp16.safetensors"
    "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_openpose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_seg-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_sketch-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_style-fp16.safetensors"

    #"https://huggingface.co/InstantX/InstantID/resolve/main/ControlNetModel/diffusion_pytorch_model.safetensors"
)


IPADAPTER_MODELS=(
    "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15.safetensors"
    "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15_light_v11.bin"
    "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus_sd15.safetensors"
    "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus-face_sd15.safetensors"
    "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15_vit-G.safetensors"
    "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl_vit-h.safetensors"
    "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors"
    "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus-face_sdxl_vit-h.safetensors"
    "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl.safetensors"
    "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sdxl.bin"
    "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait_sdxl.bin"
    "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sd15.bin"
    "https://huggingface.co/ostris/ip-composition-adapter/resolve/main/ip_plus_composition_sd15.safetensors"
    "https://huggingface.co/ostris/ip-composition-adapter/resolve/main/ip_plus_composition_sdxl.safetensors"
)

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    DISK_GB_AVAILABLE=$(($(df --output=avail -m "${WORKSPACE}" | tail -n1) / 1000))
    DISK_GB_USED=$(($(df --output=used -m "${WORKSPACE}" | tail -n1) / 1000))
    DISK_GB_ALLOCATED=$(($DISK_GB_AVAILABLE + $DISK_GB_USED))
    provisioning_print_header
    provisioning_get_nodes
    provisioning_install_python_packages
    #provisioning_searge
    provisioning_get_models \
        "${checkpoints_dir}" \
        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_models \
        "${loras_dir}" \
        "${LORA_MODELS[@]}"
    provisioning_get_models \
        "${controlnet_dir}" \
        "${CONTROLNET_MODELS[@]}"
    provisioning_get_models \
        "${vae_dir}" \
        "${VAE_MODELS[@]}"
    provisioning_get_models \
        "${esrgan_dir}" \
        "${ESRGAN_MODELS[@]}"
    
    #CUSTOM
    provisioning_ipadapter
    provisioning_instantid
    provisioning_ipadapterplus
    
    #provisioning_get_models \
    #    "${ipadapter_dir}" \
    #    "${IPADAPTER_MODELS[@]}"
    provisioning_print_end
}

function provisioning_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="/opt/ComfyUI/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                    micromamba -n comfyui run ${PIP_INSTALL} -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                micromamba -n comfyui run ${PIP_INSTALL} -r "${requirements}"
            fi
        fi
    done
}

function provisioning_install_python_packages() {
    if [ ${#PYTHON_PACKAGES[@]} -gt 0 ]; then
        micromamba -n comfyui run ${PIP_INSTALL} ${PYTHON_PACKAGES[*]}
    fi
}

function provisioning_get_models() {
    if [[ -z $2 ]]; then return 1; fi
    dir="$1"
    mkdir -p "$dir"
    shift
    if [[ $DISK_GB_ALLOCATED -ge $DISK_GB_REQUIRED ]]; then
        arr=("$@")
    else
        printf "WARNING: Low disk space allocation - Only the first model will be downloaded!\n"
        arr=("$1")
    fi
    
    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
    for url in "${arr[@]}"; do
        printf "Downloading: %s\n" "${url}"
        provisioning_download "${url}" "${dir}"
        printf "\n"
    done
}

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
    if [[ $DISK_GB_ALLOCATED -lt $DISK_GB_REQUIRED ]]; then
        printf "WARNING: Your allocated disk size (%sGB) is below the recommended %sGB - Some models will not be downloaded\n" "$DISK_GB_ALLOCATED" "$DISK_GB_REQUIRED"
    fi
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Web UI will start now\n\n"
}

# Download from $1 URL to $2 file path
function provisioning_download() {
    wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
}

# INSTANTID
function provisioning_instantid() {
    instantid_dir=${models_dir}/instantid
    insightface_dir=${models_dir}/insightface
    insightfacemodel_dir=${models_dir}/insightface/models

    if [[ ! -d $instantid_dir ]]; then
        (cd ${models_dir}  && mkdir instantid)
    fi    
    printf "\n Download instantid-ip-adapter.bin...\n"
    wget https://huggingface.co/InstantX/InstantID/resolve/main/ip-adapter.bin -O ${instantid_dir}/instantid-ip-adapter.bin

    if [[ ! -d $insightface_dir ]]; then
        (cd ${models_dir}  && mkdir insightface)
    fi  

    printf "\n Download instantid models...\n"
    wget https://huggingface.co/InstantX/InstantID/resolve/main/ControlNetModel/diffusion_pytorch_model.safetensors -O ${controlnet_dir}/instantid-diffusion_pytorch_model.safetensors
    #wget https://huggingface.co/InstantX/InstantID/resolve/main/ip-adapter.bin -O ${instantid_dir}/instantid-ip-adapter.bin       
    
    
    if [[ ! -d $insightfacemodel_dir ]]; then
        (cd ${insightface_dir}  && mkdir models)
    fi 
    printf "\n Download antelopev2...\n"
    wget https://huggingface.co/MonsterMMORPG/tools/resolve/main/antelopev2.zip -O ${insightfacemodel_dir}/antelopev2.zip
    printf "\n Unzip antelopev2...\n"
    (cd ${insightfacemodel_dir} && unzip antelopev2.zip)    
}


# IPAdapter
function provisioning_ipadapter() {
    ipadapter_dir=${models_dir}/ipadapter

    if [[ ! -d $ipadapter_dir ]]; then
        (cd ${models_dir} && mkdir ipadapter)  
    fi
      
    printf "\nPROVISIONING IPAdapter...\n"
    provisioning_get_models \
        "${ipadapter_dir}" \
        "${IPADAPTER_MODELS[@]}"
    
    #wget https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors -O ${clip_vision_dir}/CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors
    #wget https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/image_encoder/model.safetensors -O ${clip_vision_dir}/CLIP-ViT-bigG-14-laion2B-39B-b160k.safetensors

}

#ComfyUI IPAdapter plus
function provisioning_ipadapterplus() {
    ipadapterplus_dir=${custom_nodes_dir}/ComfyUI_IPAdapter_plus
    
    printf "\nCLIP VISION ipadapterplus...\n"
    if [[ ! -d $clip_vision_dir ]]; then
        (cd ${models_dir}  && mkdir clip_vision)  
    fi
      
    wget https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors -O ${clip_vision_dir}/CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors
    wget https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/image_encoder/model.safetensors -O ${clip_vision_dir}/CLIP-ViT-bigG-14-laion2B-39B-b160k.safetensors

}


function provisioning_searge() {  
    searge_git="https://github.com/SeargeDP/SeargeSDXL"
    searge_dir="/opt/ComfyUI/custom_nodes/SeargeSDXL"  

    base_model_file=${checkpoints_dir}/sd_xl_base_1.0.safetensors
    base_model_url=https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors
    refiner_model_file=${checkpoints_dir}/sd_xl_refiner_1.0.safetensors
    refiner_model_url=https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors
    sdxl_vae_file=${vae_dir}/sdxl_vae.safetensors
    sdxl_vae_url=https://huggingface.co/madebyollin/sdxl-vae-fp16-fix/resolve/main/sdxl_vae.safetensors
    offset_lora_file=${loras_dir}/sd_xl_offset_example-lora_1.0.safetensors
    offset_lora_url=https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_offset_example-lora_1.0.safetensors
    siax_upscale_file=${upscale_dir}/4x_NMKD-Siax_200k.pth
    siax_upscale_url=https://huggingface.co/uwg/upscaler/resolve/main/ESRGAN/4x_NMKD-Siax_200k.pth
    ultrasharp_upscale_file=${upscale_dir}/4x-UltraSharp.pth
    ultrasharp_upscale_url=https://huggingface.co/uwg/upscaler/resolve/main/ESRGAN/4x-UltraSharp.pth

    if [[ ! -d $searge_dir ]]; then
        git clone https://github.com/SeargeDP/SeargeSDXL $searge_dir
    else
        cd $searge_dir && git pull
    fi

    if [[ ! -f ${base_model_file} ]]; then
        wget -O ${base_model_file} ${base_model_url}
    fi

    if [[ ! -f ${refiner_model_file} ]]; then
        wget -O ${refiner_model_file} ${refiner_model_url}
    fi

    if [[ ! -f ${sdxl_vae_file} ]]; then
        wget -O ${sdxl_vae_file} ${sdxl_vae_url}
    fi

    if [[ ! -f ${offset_lora_file} ]]; then
        wget -O ${offset_lora_file} ${offset_lora_url}
    fi

    if [[ ! -f ${siax_upscale_file} ]]; then
        wget -O ${siax_upscale_file} ${siax_upscale_url}
    fi

    if [[ ! -f ${ultrasharp_upscale_file} ]]; then
        wget -O ${ultrasharp_upscale_file} ${ultrasharp_upscale_url}
    fi
}

provisioning_start