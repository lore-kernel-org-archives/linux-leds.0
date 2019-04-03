From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 0/5] TI LMU rework
Date: Wed, 3 Apr 2019 07:02:07 -0500
Message-ID: <1037091e-1f4a-3922-16ee-282253dad7e0@ti.com>
References: <20190325142403.30447-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190325142403.30447-1-dmurphy@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-Id: linux-leds@vger.kernel.org

Hello

On 3/25/19 9:23 AM, Dan Murphy wrote:
> All
> 
> I know that it has been a long time but I put some additional effort into this
> code.  The TI LMU common code right now handles brightness and ramp up/down
> setting for the LM3697.  This so far are the common features I could find.
> 
> The LM3697 driver has the ability to assign HVLED strings to specific control
> banks as well as assigning different max brightnesses to these strings.
> 
> Fault monitoring was removed as the data sheet indicates that this is for
> production tests only.
> 
> I have plans to add additional LED drivers to use the TI LMU but I figured trying
> to add all of them at once would be a daunting review and probably wrought with 
> problems.
> 

I have a new device I need to add to the TI LMU code LM36274.
This will use the MFD ti-lmu code and I will need to create the backlight and regulator drivers.

I need to know how to proceed.  I can base the work off of the LM3532 patchset or use what is in mainline
or base it off this patchset.  The LM36274 would use the ti-lmu-led-common code for brightness setting but the
ramping times are different.

Please let me know how to proceed.

Dan

> Dan
> 
> Dan Murphy (5):
>   dt-bindings: mfd: Update the ramp up/down property
>   leds: TI LMU: Add common code for TI LMU devices
>   dt-bindings: ti-lmu: Modify dt bindings for the LM3697
>   mfd: ti-lmu: Remove support for LM3697
>   leds: lm3697: Introduce the lm3697 driver
> 
>  .../devicetree/bindings/leds/leds-lm3697.txt  |  77 ++++
>  .../devicetree/bindings/mfd/ti-lmu.txt        |  42 +-
>  drivers/leds/Kconfig                          |  14 +
>  drivers/leds/Makefile                         |   2 +
>  drivers/leds/leds-lm3697.c                    | 401 ++++++++++++++++++
>  drivers/leds/ti-lmu-led-common.c              | 131 ++++++
>  drivers/mfd/Kconfig                           |   2 +-
>  drivers/mfd/ti-lmu.c                          |  17 -
>  include/linux/mfd/ti-lmu-register.h           |  44 --
>  include/linux/mfd/ti-lmu.h                    |   1 -
>  include/linux/ti-lmu-led-common.h             |  44 ++
>  11 files changed, 682 insertions(+), 93 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
>  create mode 100644 drivers/leds/leds-lm3697.c
>  create mode 100644 drivers/leds/ti-lmu-led-common.c
>  create mode 100644 include/linux/ti-lmu-led-common.h
> 


-- 
------------------
Dan Murphy
