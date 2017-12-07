From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 1/6] dt: bindings: lp8860: Update bindings for lp8860
Date: Thu, 7 Dec 2017 17:07:56 -0600
Message-ID: <c981cd96-e508-4b7a-ebfc-fe99eb1f46fc@ti.com>
References: <20171205204327.12111-1-dmurphy@ti.com>
 <20171205204327.12111-2-dmurphy@ti.com>
 <20171207224229.wd6nc4ukiksebxw4@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:31100 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750973AbdLGXIM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 7 Dec 2017 18:08:12 -0500
In-Reply-To: <20171207224229.wd6nc4ukiksebxw4@rob-hp-laptop>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Rob

Thanks

On 12/07/2017 04:42 PM, Rob Herring wrote:
> gOn Tue, Dec 05, 2017 at 02:43:22PM -0600, Dan Murphy wrote:
>> Update the lp8860 bindings to fix various issues
>> found.  Add address-cells and size-cells, rename
>> enable-gpio to enable-gpios, update the node name
>> to the device name and indent the node example.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>
>> v2 - New patch
>>
>>  .../devicetree/bindings/leds/leds-lp8860.txt       | 28 ++++++++++++----------
>>  1 file changed, 16 insertions(+), 12 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
>> index aad38dd94d4b..1b2fab05ec6a 100644
>> --- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
>> +++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
>> @@ -6,24 +6,28 @@ current sinks that can be controlled by a PWM input
>>  signal, a SPI/I2C master, or both.
>>  
>>  Required properties:
>> -	- compatible:
>> +	- compatible :
>>  		"ti,lp8860"
>> -	- reg -  I2C slave address
>> -	- label - Used for naming LEDs
>> +	- reg : I2C slave address
>> +	- label : Used for naming LEDs
>> +	- #address-cells : 1
>> +	- #size-cells : 0
>>  
>>  Optional properties:
>> -	- enable-gpio - gpio pin to enable/disable the device.
>> -	- supply - "vled" - LED supply
>> +	- enable-gpios : gpio pin to enable/disable the device.
> 
> Needs to state active high or low.

Ack

> 
>> +	- supply : "vled" - LED supply
> 
> "vled-supply : ..."
> 

Ack

>>  
>>  Example:
>>  
>> -leds: leds@6 {
>> -	compatible = "ti,lp8860";
>> -	reg = <0x2d>;
>> -	label = "display_cluster";
>> -	enable-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
>> -	vled-supply = <&vbatt>;
>> -}
>> +	lp8860@2d {
> 
> leds@2d
> 
> There's not really any point in adding the indentation.

OK I was just following convention of other child node LED bindings

I can remove the indents.

> 
>> +		compatible = "ti,lp8860";
> 
>> +		#address-cells: 1
>> +		#size-cells: 0
> 
> s/:/=/
> 
> Though, these aren't necessary without any child nodes. Is there more 
> than 1 LED channel/driver?
> 

Yes this device can be used to drive at least 4 different LED strings as well
I will be adding this feature once I get this driver and binding cleaned up.

Dan

>> +		reg = <0x2d>;
>> +		label = "display_cluster";
>> +		enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
>> +		vled-supply = <&vbatt>;
>> +	}
>>  
>>  For more product information please see the link below:
>>  http://www.ti.com/product/lp8860-q1
>> -- 
>> 2.15.0.124.g7668cbc60
>>


-- 
------------------
Dan Murphy
