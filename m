From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 7/9] dt: bindings: lp50xx: Introduce the lp50xx family
 of RGB drivers
Date: Tue, 11 Jun 2019 15:51:21 -0600
Message-ID: <20190611215121.GA14337@bogus>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-8-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190523190820.29375-8-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, May 23, 2019 at 02:08:18PM -0500, Dan Murphy wrote:
> Introduce the bindings for the Texas Instruments LP5036, LP5030, LP5024 and
> LP5018 RGB LED device driver.  The LP5036/30/24/18 can control RGB LEDs
> individually or as part of a control bank group.  These devices have the ability
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

Reviewed-by: Rob Herring <robh@kernel.org>
