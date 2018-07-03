From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/4] leds: lm3692x: Update license header to SPDX
Date: Tue, 3 Jul 2018 22:56:38 +0200
Message-ID: <5845fa3b-a70e-bf7b-41e6-5b8a2a837f4a@gmail.com>
References: <20180702181216.19660-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180702181216.19660-1-dmurphy@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, mark.rutland@arm.com, andy.shevchenko@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Dan,

Thank you for the patch set, applied.

Best regards,
Jacek Anaszewski

On 07/02/2018 08:12 PM, Dan Murphy wrote:
> Update the license header to the current
> SPDX licensing format.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   drivers/leds/leds-lm3692x.c | 17 +++--------------
>   1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
> index 437173d1712c..1a06d8c97789 100644
> --- a/drivers/leds/leds-lm3692x.c
> +++ b/drivers/leds/leds-lm3692x.c
> @@ -1,17 +1,6 @@
> -/*
> - * TI lm3692x LED Driver
> - *
> - * Copyright (C) 2017 Texas Instruments
> - *
> - * Author: Dan Murphy <dmurphy@ti.com>
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU General Public License
> - * version 2 as published by the Free Software Foundation.
> - *
> - * Data sheet is located
> - * http://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
> - */
> +// SPDX-License-Identifier: GPL-2.0
> +// TI LM3692x LED chip family driver
> +// Copyright (C) 2017-18 Texas Instruments Incorporated - http://www.ti.com/
>   
>   #include <linux/gpio/consumer.h>
>   #include <linux/i2c.h>
> 
