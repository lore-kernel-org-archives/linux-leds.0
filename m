From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v4 2/6] dt: bindings: lp8860: Update DT label binding
Date: Mon, 18 Dec 2017 07:08:28 -0600
Message-ID: <d4224a4c-95c8-e263-63a9-3dc1f633e5a9@ti.com>
References: <20171212220143.31210-1-dmurphy@ti.com>
 <20171212220143.31210-3-dmurphy@ti.com>
 <20171215225914.62lqxhcmwajf4hpy@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from lelnx194.ext.ti.com ([198.47.27.80]:18571 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758168AbdLRNIw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Dec 2017 08:08:52 -0500
In-Reply-To: <20171215225914.62lqxhcmwajf4hpy@rob-hp-laptop>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Rob

On 12/15/2017 04:59 PM, Rob Herring wrote:
> On Tue, Dec 12, 2017 at 04:01:39PM -0600, Dan Murphy wrote:
>> Update the lp8860 label binding to the LED
>> standard as documented in
>>
>> Documentation/devicetree/bindings/leds/common.txt
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>
>> v4 - No changes
>>
>> v3 - Added address and size cells, updated label with color and inserted spaces
>> around the reg node - https://patchwork.kernel.org/patch/10093749/
>> v2 - Added reg to child node and made it required
>>
>>  Documentation/devicetree/bindings/leds/leds-lp8860.txt | 17 +++++++++++++++--
>>  1 file changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
>> index b9d09acbaa73..c3d64ade1e26 100644
>> --- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
>> +++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
>> @@ -9,20 +9,33 @@ Required properties:
>>  	- compatible :
>>  		"ti,lp8860"
>>  	- reg : I2C slave address
>> -	- label : Used for naming LEDs
>> +	- #address-cells : 1
>> +	- #size-cells : 0
>>  
>>  Optional properties:
>>  	- enable-gpios : gpio pin to enable (active high)/disable the device.
>>  	- vled-supply : LED supply
>>  
>> +Required child properties:
>> +	- reg : 0
>> +
> 
> This should be in previous patch?


No this is the reg node for the child property.  The child property is
introduced in this patch.  So this should be correct

Dan

> 
>> +Optional child properties:
>> +	- label : see Documentation/devicetree/bindings/leds/common.txt
>> +
>>  Example:
>>  
>>  led-controller@2d {
>>  	compatible = "ti,lp8860";
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>>  	reg = <0x2d>;
>> -	label = "display_cluster";
>>  	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
>>  	vled-supply = <&vbatt>;
>> +
>> +	led@0 {
>> +		reg = <0>;
>> +		label = "white:display_cluster";
>> +	};
>>  }
>>  
>>  For more product information please see the link below:
>> -- 
>> 2.15.0.124.g7668cbc60
>>


-- 
------------------
Dan Murphy
