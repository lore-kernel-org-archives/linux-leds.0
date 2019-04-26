From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 05/26] dt-bindings: leds: Add properties for LED name
 construction
Date: Fri, 26 Apr 2019 13:58:08 -0500
Message-ID: <20190426185808.GA28168@bogus>
References: <20190417205439.17685-1-jacek.anaszewski@gmail.com>
 <20190417205439.17685-6-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190417205439.17685-6-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net, jacek.anaszewski@gmail.com, Baolin Wang <baolin.wang@linaro.org>, Dan Murphy <dmurphy@ti.com>, Daniel Mack <daniel@zonque.org>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

On Wed, 17 Apr 2019 22:54:18 +0200, Jacek Anaszewski wrote:
> Introduce dedicated properties for conveying information about
> LED function and color. Mark old "label" property as deprecated.
> 
> Additionally function-enumerator property is being provided
> for the cases when neither function nor color can be used
> for LED differentiation.
> 
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Oleh Kravchenko <oleg@kaa.org.ua>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Simon Shields <simon@lineageos.org>
> ---
>  Documentation/devicetree/bindings/leds/common.txt | 62 ++++++++++++++++++++---
>  1 file changed, 54 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
