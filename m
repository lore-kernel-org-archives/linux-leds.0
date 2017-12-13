From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 0/6] Updated LP8860 driver series
Date: Wed, 13 Dec 2017 20:55:45 +0100
Message-ID: <5aabfe2b-d643-6439-dd0f-f391b6ce521d@gmail.com>
References: <20171212220143.31210-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171212220143.31210-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Dan,

Patch set applied, thanks.

-- 
Best regards,
Jacek Anaszewski

On 12/12/2017 11:01 PM, Dan Murphy wrote:
> All
> 
> v4 - Fix checkpatch warning for code indentation on the
> leds: lp8860: Update the dt parsing for LED labeling patch.
> 
> v3 - Made changes to the patch set to address concerns on DT node naming conventions
> based on discussion in the RFC patch https://patchwork.kernel.org/patch/10089047/
> also made requested changes to the DT and driver based on feedback.  Patchworks
> links in each patch.
> 
> v2 - Added an initial patch to bring the DT binding up to standard prior to adding
> the changes for the label and triggers.
> 
> v1 Cover letter repeat below
> 
> After creating a new LED driver for the LM3692x device I went back to the
> LP8860 driver that I authored and found some updates that need to be applied.
> 
> First the way the LP8860 retrieved the label from the DT was incorrect as the
> label should have been from a child node as opposed to the parent.  This is now
> fixed with this series.
> 
> Second, since that device can be used to as either a backlight driver or as a
> string agnostic driver a trigger to the backlight needed to be added.
> 
> Finally there are changes to the driver that need to be made as either
> unnoticed bugs or updates to the driver to align with the current LED
> framework.  For instance moving to the devm LED class registration, destroying
> the mutex upon driver removal and removing the in driver dependency on CONFIG_OF
> and moving it to the Kconfig.
> 
> With these changes this should at least bring the driver into a better shape.
> 
> There are additional changes coming for this driver but I wanted to get the
> driver up to snuff before adding a feature to it.
> 
> Dan
> 
> Dan Murphy (6):
>   dt: bindings: lp8860: Update bindings for lp8860
>   dt: bindings: lp8860: Update DT label binding
>   leds: lp8860: Update the dt parsing for LED labeling
>   dt: bindings: lp8860: Add trigger binding to the lp8860
>   leds: lp8860: Add DT parsing to retrieve the trigger node
>   leds: lp8860: Various fixes to align with LED framework
> 
>  .../devicetree/bindings/leds/leds-lp8860.txt       | 32 ++++++++++++-----
>  drivers/leds/Kconfig                               |  2 +-
>  drivers/leds/leds-lp8860.c                         | 40 ++++++++++++----------
>  3 files changed, 46 insertions(+), 28 deletions(-)
> 
