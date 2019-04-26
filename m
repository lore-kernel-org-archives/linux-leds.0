From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 23/26] dt-bindings: leds-gpio: Add function and color
 properties
Date: Fri, 26 Apr 2019 14:23:29 -0500
Message-ID: <20190426192329.GA8254@bogus>
References: <20190417205439.17685-1-jacek.anaszewski@gmail.com>
 <20190417205439.17685-24-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190417205439.17685-24-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net, jacek.anaszewski@gmail.com, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-leds@vger.kernel.org

On Wed, 17 Apr 2019 22:54:36 +0200, Jacek Anaszewski wrote:
> Refer to new "function" and "color" properties and mark "label"
> as deprecated.
> 
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/leds/leds-gpio.txt         | 23 +++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
