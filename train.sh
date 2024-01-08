#!/bin/bash
CUDA_VISIBLE_DEVICES=0 python src/train_bash.py \
    --stage sft \
    --do_train True \
    --model_name_or_path bigscience/bloom-560m \
    --finetuning_type lora \
    --template default \
    --dataset_dir data \
    --dataset alpaca_gpt4_en,alpaca_gpt4_zh \
    --cutoff_len 1024 \
    --learning_rate 0.00025 \
    --num_train_epochs 3.0 \
    --max_samples 100000 \
    --per_device_train_batch_size 4 \
    --gradient_accumulation_steps 4 \
    --lr_scheduler_type cosine \
    --max_grad_norm 1.0 \
    --logging_steps 5 \
    --save_steps 100 \
    --warmup_steps 0 \
    --neftune_noise_alpha 0 \
    --lora_rank 8 \
    --lora_dropout 0.1 \
    --lora_target query_key_value \
    --output_dir saves/BLOOM-560M/lora/train_2024-01-08-09-25-22 \
    --fp16 True \
    --plot_loss True
