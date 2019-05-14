From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 0/6] LM36274 Introduction
Date: Tue, 14 May 2019 21:11:29 +0200
Message-ID: <aface058-d34c-9ae0-838d-7e8b0cfe6e10@gmail.com>
References: <20190507201159.13940-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507201159.13940-1-dmurphy@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc: lee.jones@linaro.org, rdunlap@infradead.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
List-Id: linux-leds@vger.kernel.org

I need acks from regulator framework maintainer for patches
1/6 and 4/6.

Adding Liam and Mark.

On 5/7/19 10:11 PM, Dan Murphy wrote:
> Hello
> 
> This is patch set v4 for the LM36274.  There were no changes made
> to this patch set except to rebase this on top of the latest TI LMU common code
> patchset.
> 
> This patch set was rebased on the series at:
> https://lore.kernel.org/patchwork/project/lkml/list/?series=393071
> 
> Dan
> 
> Dan Murphy (6):
>    regulator: lm363x: Make the gpio register enable flexible
>    dt-bindings: mfd: Add lm36274 bindings to ti-lmu
>    mfd: ti-lmu: Add LM36274 support to the ti-lmu
>    regulator: lm363x: Add support for LM36274
>    dt-bindings: leds: Add LED bindings for the LM36274
>    leds: lm36274: Introduce the TI LM36274 LED driver
> 
>   .../devicetree/bindings/leds/leds-lm36274.txt |  82 +++++++++
>   .../devicetree/bindings/mfd/ti-lmu.txt        |  54 ++++++
>   drivers/leds/Kconfig                          |   7 +
>   drivers/leds/Makefile                         |   1 +
>   drivers/leds/leds-lm36274.c                   | 174 ++++++++++++++++++
>   drivers/mfd/Kconfig                           |   5 +-
>   drivers/mfd/ti-lmu.c                          |  14 ++
>   drivers/regulator/Kconfig                     |   2 +-
>   drivers/regulator/lm363x-regulator.c          |  56 +++++-
>   include/linux/mfd/ti-lmu-register.h           |  23 +++
>   include/linux/mfd/ti-lmu.h                    |   4 +
>   11 files changed, 416 insertions(+), 6 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.txt
>   create mode 100644 drivers/leds/leds-lm36274.c
> 

-- 
Best regards,
Jacek Anaszewski
