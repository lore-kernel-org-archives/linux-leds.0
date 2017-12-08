From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH/RFC] DT: leds: Fix 'label' property description and add
 'colour' property
Date: Fri, 8 Dec 2017 10:01:45 -0600
Message-ID: <1c741846-63d3-f940-4888-1b1899147ab0@ti.com>
References: <1512251410-6084-1-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512251410-6084-1-git-send-email-jacek.anaszewski@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robh@kernel.org, pavel@ucw.cz, sakari.ailus@iki.fi
List-Id: linux-leds@vger.kernel.org

Jacek

On 12/02/2017 03:50 PM, Jacek Anaszewski wrote:
> Label property was imposed a uniqueness requirement, which was erroneous,
> since ePAPR defines it to "a human readable string describing a device".
> 
> Also the binding description misleadingly suggested direct usage of label
> for LED class device name, whereas it should only define a LED function.
> 
> Therefore an additional 'colour' property is being introduced, which together
> with the parent DT node name used for devicename shall be used for naming LED
> class device according to the patterh <devicename>:<colour>:<function>.
> 

In submitting updated DT bindings the maintainers are requesting all device parent
LED nodes be 

leds@xx {

Now this will make every LED class devicename

leds:<colour>:<function>

So either we cannot use the devicename or we need need to use the compatible string instead.

So an example would be

ti,lp8860:white:backlight

You should be on these patches.

Dan

> Fixes: 116b8e164116 ("DT: leds: Add uniqueness requirement for 'label' property")
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> ---
>  Documentation/devicetree/bindings/leds/common.txt | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 1d4afe9..16973ee 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -14,10 +14,9 @@ Optional properties for child nodes:
>  - led-sources : List of device current outputs the LED is connected to. The
>  		outputs are identified by the numbers that must be defined
>  		in the LED device binding documentation.
> -- label : The label for this LED. If omitted, the label is taken from the node
> -	  name (excluding the unit address). It has to uniquely identify
> -	  a device, i.e. no other LED class device can be assigned the same
> -	  label.
> +- label : The label for this LED. It should describe its function. If omitted,
> +          the label is taken from the node name (excluding the unit address).
> +- colour : Colour of the LED.
>  
>  - default-state : The initial state of the LED. Valid values are "on", "off",
>    and "keep". If the LED is already on or off and the default-state property is
> 


-- 
------------------
Dan Murphy
