From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 0/7] LMU Common code intro
Date: Wed, 8 May 2019 07:21:04 +0100
Message-ID: <20190508062104.GC7627@dell>
References: <20190430191730.19450-1-dmurphy@ti.com>
 <34088323-9b40-7dea-5449-6a01bb721c00@gmail.com>
 <8166c0c1-facf-14da-7c71-5bc5a3cc23f7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8166c0c1-facf-14da-7c71-5bc5a3cc23f7@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Wed, 01 May 2019, Jacek Anaszewski wrote:

> Ekhm, I forgot to add the main recipient.
> 
> Adding Lee.
> 
> On 5/1/19 12:05 AM, Jacek Anaszewski wrote:
> > Hi Lee,
> > 
> > This patch set has dependency on the previous one for lm3532, which
> > also touches ti-lmu.txt bindings, and for which I already created
> > immutable branch. Now if I created another immutable branch for
> > this patch set we would have to resolve conflicts between the two,
> > as they would both be based on 5.1-rc1. Adds much overhead and
> > is error prone. Therefore I propose to apply this patch set on
> > top of my merge of LED tree with the immutable branch for lm3532.
> > 
> > Please let me know if you see it differently. I'll wait for your
> > response until Friday, and then proceed with the above as I think
> > it should be harmless for MFD.

Looks like this set wasn't sent until -rc6 which is when I normally
stop applying significant patches.  I think it's best that we wait
until the next rotation.  That way all this dependency related
hoop-jumping just goes away.

> > On 4/30/19 9:17 PM, Dan Murphy wrote:
> > > Hello
> > > 
> > > I have added the Reviewed-by for dt bindings as well as made the
> > > Kconfig change
> > > pointed out for the common code flag
> > > 
> > > Dan
> > > 
> > > Dan Murphy (7):
> > >    dt-bindings: mfd: LMU: Fix lm3632 dt binding example
> > >    dt-bindings: mfd: LMU: Add the ramp up/down property
> > >    dt-bindings: mfd: LMU: Add ti,brightness-resolution
> > >    leds: TI LMU: Add common code for TI LMU devices
> > >    dt-bindings: ti-lmu: Modify dt bindings for the LM3697
> > >    mfd: ti-lmu: Remove support for LM3697
> > >    leds: lm3697: Introduce the lm3697 driver
> > > 
> > >   .../devicetree/bindings/leds/leds-lm3697.txt  |  73 ++++
> > >   .../devicetree/bindings/mfd/ti-lmu.txt        |  56 ++-
> > >   drivers/leds/Kconfig                          |  15 +
> > >   drivers/leds/Makefile                         |   2 +
> > >   drivers/leds/leds-lm3697.c                    | 395 ++++++++++++++++++
> > >   drivers/leds/ti-lmu-led-common.c              | 155 +++++++
> > >   drivers/mfd/Kconfig                           |   2 +-
> > >   drivers/mfd/ti-lmu.c                          |  17 -
> > >   include/linux/mfd/ti-lmu-register.h           |  44 --
> > >   include/linux/mfd/ti-lmu.h                    |   1 -
> > >   include/linux/ti-lmu-led-common.h             |  47 +++
> > >   11 files changed, 712 insertions(+), 95 deletions(-)
> > >   create mode 100644
> > > Documentation/devicetree/bindings/leds/leds-lm3697.txt
> > >   create mode 100644 drivers/leds/leds-lm3697.c
> > >   create mode 100644 drivers/leds/ti-lmu-led-common.c
> > >   create mode 100644 include/linux/ti-lmu-led-common.h
> > > 
> > 
> > 
> 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
