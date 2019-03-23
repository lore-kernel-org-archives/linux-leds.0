From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 3/4] mfd: ti-lmu: Remove LM3532 backlight driver
 references
Date: Sat, 23 Mar 2019 17:47:21 +0100
Message-ID: <8769a95d-179f-6219-0a63-9dd623cdd297@gmail.com>
References: <20190321142838.22985-1-dmurphy@ti.com>
 <20190321142838.22985-3-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321142838.22985-3-dmurphy@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, pavel@ucw.cz, tony@atomide.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Lee,

Can we have your ack for this going via LED tree, please?

Best regards,
Jacek Anaszewski

On 3/21/19 3:28 PM, Dan Murphy wrote:
> Remove the LM3532 backlight driver references from the ti-lmu
> code as dedicated driver support is available.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v5 - No changes - https://lore.kernel.org/patchwork/patch/1050411/
> 
> v4 - No changes - https://lore.kernel.org/patchwork/patch/1050123/
> v3 - No changes - https://lore.kernel.org/patchwork/patch/1049025/
> v2 - Removed LM3532 register definitions from ti-lmu-register - https://lore.kernel.org/patchwork/patch/1048808/
> 
>   drivers/mfd/ti-lmu.c                | 11 --------
>   include/linux/mfd/ti-lmu-register.h | 44 -----------------------------
>   include/linux/mfd/ti-lmu.h          |  1 -
>   3 files changed, 56 deletions(-)
[...]
