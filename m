From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/4] leds: Replace dedicated SN3218 driver with
 IS31FL32XX driver
Date: Fri, 4 Mar 2016 22:28:40 -0600
Message-ID: <20160305042840.GU13525@rob-hp-laptop>
References: <1456974095-1867-1-git-send-email-drivshin.allworx@gmail.com>
 <1456974095-1867-5-git-send-email-drivshin.allworx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456974095-1867-5-git-send-email-drivshin.allworx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Wed, Mar 02, 2016 at 10:01:35PM -0500, David Rivshin (Allworx) wrote:
> From: David Rivshin <drivshin@allworx.com>
> 
> Si-En Technology was acquired by ISSI in 2011, and it appears that
> the IS31FL3218/IS31FL3216 are just rebranded SN3218/SN3216 devices.
> As the IS31FL32XX driver already handles the *3218 devices, there
> is no longer a need for the dedicated SN3218 driver.
> 
> Add the "sn,sn3218" and "sn,sn3216" compatible strings into the
> IS31FL32XX driver and binding documentation, and remove the
> leds-sn3218 driver.
> 
> Datasheets:
>     IS31FL3218: http://www.issi.com/WW/pdf/31FL3218.pdf
>     SN3218:     http://www.si-en.com/uploadpdf/s2011517171720.pdf
> 
>     IS31FL3216: http://www.issi.com/WW/pdf/31FL3216.pdf
>     SN3216;     http://www.si-en.com/uploadpdf/SN3216201152410148.pdf
> 
> Signed-off-by: David Rivshin <drivshin@allworx.com>
> ---
> 
> Note that the leds-sn3218 binding use a 0-based 'reg' property, while
> the leds-is31fl32xx binding uses a 1-based 'reg' property. This seemed
> to be the preferred binding based on [1]. Since leds-sn3216 has not been
> in a released kernel, there is are no backwards-compatibility concerns.

It would probably make more sense to revert the sn3216 driver/binding 
and add the additions to the previous patches. Doesn't matter to me 
though.

Acked-by: Rob Herring <robh@kernel.org>

> 
> Changes from RFC:
>  new
> 
> [1] http://www.spinics.net/lists/linux-leds/msg05589.html
> 
>  .../devicetree/bindings/leds/leds-is31fl32xx.txt   |   9 +-
>  .../devicetree/bindings/leds/leds-sn3218.txt       |  41 ---
>  drivers/leds/Kconfig                               |  18 +-
>  drivers/leds/Makefile                              |   1 -
>  drivers/leds/leds-is31fl32xx.c                     |   6 +-
>  drivers/leds/leds-sn3218.c                         | 306 ---------------------
>  6 files changed, 14 insertions(+), 367 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-sn3218.txt
>  delete mode 100644 drivers/leds/leds-sn3218.c
