From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 3/6] mfd: ti-lmu: Add LM36274 support to the ti-lmu
Date: Wed, 8 May 2019 12:53:27 +0100
Message-ID: <20190508115327.GO31645@dell>
References: <20190507201159.13940-1-dmurphy@ti.com>
 <20190507201159.13940-4-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190507201159.13940-4-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, rdunlap@infradead.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue, 07 May 2019, Dan Murphy wrote:

> Add the LM36274 register support to the ti-lmu MFD driver.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/mfd/Kconfig                 |  5 ++---
>  drivers/mfd/ti-lmu.c                | 14 ++++++++++++++
>  include/linux/mfd/ti-lmu-register.h | 23 +++++++++++++++++++++++
>  include/linux/mfd/ti-lmu.h          |  4 ++++
>  4 files changed, 43 insertions(+), 3 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
