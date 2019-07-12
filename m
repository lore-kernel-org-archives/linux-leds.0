From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 2/2] dt-bindings: leds: document new "power-supply"
 property
Date: Fri, 12 Jul 2019 13:38:10 -0500
Message-ID: <cd233d13-b4dd-1c4f-235e-d63cebab6f4f@ti.com>
References: <20190708103547.23528-1-jjhiblot@ti.com>
 <20190708103547.23528-3-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190708103547.23528-3-jjhiblot@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, daniel.thompson@linaro.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

JJ

On 7/8/19 5:35 AM, Jean-Jacques Hiblot wrote:
> Most of the LEDs are powered by a voltage/current regulator. describing in
> the device-tree makes it possible for the LED core to enable/disable it
> when needed.

This should be patch 1.


> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>   Documentation/devicetree/bindings/leds/common.txt | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 70876ac11367..e093a2b7eb90 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -61,6 +61,11 @@ Optional properties for child nodes:
>   - panic-indicator : This property specifies that the LED should be used,
>   		    if at all possible, as a panic indicator.
>   
> +- power-supply : A voltage/current regulator used to to power the LED. When a
> +		 LED is turned off, the LED core disable its regulator. The
> +		 same regulator can power many LED (or other) devices. It is
> +		 turned off only when all of its users disabled it.
> +
>   - trigger-sources : List of devices which should be used as a source triggering
>   		    this LED activity. Some LEDs can be related to a specific
>   		    device and should somehow indicate its state. E.g. USB 2.0


Do you have an example update?

Dan
