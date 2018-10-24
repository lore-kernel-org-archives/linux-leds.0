From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/7] dt-bindings: ti-lmu: Modify dt bindings for the
 LM3697
Date: Wed, 24 Oct 2018 09:49:51 -0500
Message-ID: <20181024144951.GB9327@bogus>
References: <20181023170623.31820-1-dmurphy@ti.com>
 <20181023170623.31820-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181023170623.31820-2-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, lee.jones@linaro.org, tony@atomide.com
List-Id: linux-leds@vger.kernel.org

On Tue, Oct 23, 2018 at 12:06:18PM -0500, Dan Murphy wrote:
> The LM3697 is a single function LED driver. The single function LED
> driver needs to reside in the LED directory as a dedicated LED driver
> and not as a MFD device.  The device does have common brightness and ramp
> features and those can be accomodated by a TI LMU framework.
> 
> The LM3697 dt binding needs to be moved from the ti-lmu.txt and a dedicated
> LED dt binding needs to be added.  The new LM3697 LED dt binding will then
> reside in the Documentation/devicetree/bindings/leds directory and follow the
> current LED and general bindings guidelines.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v4 - Squashed removal and addition of the dt bindings into a single patch - https://lore.kernel.org/patchwork/patch/998703/

Still not really the sequence I'd like to see and what I think would 
help the discussion move along.

Patch 1: move all the devices out of ti-lmu.txt into the grouping which 
makes sense. IOW, no functional changes. Probably only strict 
sub/supersets of each other should be shared.

Patch 2-N: Make binding changes. Then we discuss things like ramp time 
properties separately from binding structure.

> 
>  .../devicetree/bindings/leds/leds-lm3697.txt  | 98 +++++++++++++++++++
>  .../devicetree/bindings/mfd/ti-lmu.txt        | 26 +----
>  2 files changed, 99 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
