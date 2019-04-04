From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 4/5] mfd: ti-lmu: Remove support for LM3697
Date: Thu, 4 Apr 2019 09:18:09 +0100
Message-ID: <20190404081809.GN6830@dell>
References: <20190325142403.30447-1-dmurphy@ti.com>
 <20190325142403.30447-5-dmurphy@ti.com>
 <20190404081736.GM6830@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190404081736.GM6830@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, 04 Apr 2019, Lee Jones wrote:

> On Mon, 25 Mar 2019, Dan Murphy wrote:
> 
> > Remove support for the LM3697 from the ti-lmu
> 
> Bit of an odd place to insert a line feed.
> 
> > driver in favor of a dedicated LED driver.
> > 
> > Signed-off-by: Dan Murphy <dmurphy@ti.com>
> > ---
> >  drivers/leds/Kconfig                |  2 +-
> >  drivers/mfd/Kconfig                 |  2 +-
> >  drivers/mfd/ti-lmu.c                | 17 -----------
> >  include/linux/mfd/ti-lmu-register.h | 44 -----------------------------
> >  include/linux/mfd/ti-lmu.h          |  1 -
> >  5 files changed, 2 insertions(+), 64 deletions(-)
> 
> I'm fine with the patch.
> 
> Can you edit drivers/leds/Kconfig as part of a separate patch please?
> Keeping this in sync with this change is not critical and would add a
> whole bunch of process which we can really do without.

BTW, please add my:

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
