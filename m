From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 6/7] dt: bindings: lp50xx: Introduce the lp50xx family
 of RGB drivers
Date: Mon, 29 Apr 2019 16:15:42 -0500
Message-ID: <20190429211542.GA28956@bogus>
References: <20190411193848.23140-1-dmurphy@ti.com>
 <20190411193848.23140-7-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190411193848.23140-7-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, marek.behun@nic.cz, rdunlap@infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

On Thu, 11 Apr 2019 14:38:47 -0500, Dan Murphy wrote:
> Introduce the bindings for the Texas Instruments LP5036, LP5030, LP5024 and the LP5018
> RGB LED device driver.  The LP5036/3024/18 can control RGB LEDs individually
> or as part of a control bank group.  These devices have the ability
> to adjust the mixing control for the RGB LEDs to obtain different colors
> independent of the overall brightness of the LED grouping.
> 
> Datasheet:
> http://www.ti.com/lit/ds/symlink/lp5024.pdf
> http://www.ti.com/lit/ds/symlink/lp5036.pdf
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../devicetree/bindings/leds/leds-lp50xx.txt  | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
