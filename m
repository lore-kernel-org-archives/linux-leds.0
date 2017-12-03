From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v6 4/6] dt: bindings: lp8860: Update the bindings to the
 standard
Date: Sun, 3 Dec 2017 15:34:54 +0100
Message-ID: <e7ad5d50-dfd4-92eb-382c-f6534e089b8b@gmail.com>
References: <20171201165613.10358-1-dmurphy@ti.com>
 <20171201165613.10358-4-dmurphy@ti.com>
 <7a1f392c-9e2c-0a47-c10b-a2330228f52f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:38621 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751528AbdLCOfv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 3 Dec 2017 09:35:51 -0500
In-Reply-To: <7a1f392c-9e2c-0a47-c10b-a2330228f52f@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, rpurdie@rpsys.net, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/03/2017 02:49 PM, Jacek Anaszewski wrote:
> Hi Dan,
> 
> Thanks for the patch.
> 
> On 12/01/2017 05:56 PM, Dan Murphy wrote:
>> Update the lp8860 dt binding to the LED standard where
>> the LED should have a child node and also adding a
>> LED trigger entry.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>
>> v6 - New patch to fix binding documentation
>>
>>  Documentation/devicetree/bindings/leds/leds-lp8860.txt | 15 +++++++++++----
>>  1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
>> index aad38dd94d4b..4cf396de6eba 100644
>> --- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
>> +++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
>> @@ -12,17 +12,24 @@ Required properties:
>>  	- label - Used for naming LEDs
>>  
>>  Optional properties:
>> -	- enable-gpio - gpio pin to enable/disable the device.
>> -	- supply - "vled" - LED supply
>> +	- enable-gpios : gpio pin to enable/disable the device.
>> +	- vled-supply : LED supply
>> +	- label : see Documentation/devicetree/bindings/leds/common.txt
>> +	- linux,default-trigger : (optional)
>> +	   see Documentation/devicetree/bindings/leds/common.txt
> 
> Related driver doesn't parse this DT property AFAICS.

Ah, I missed that you're adding it in 5/6.

> 
>>  Example:
>>  
>> -leds: leds@6 {
>> +lp8860@2d {
>>  	compatible = "ti,lp8860";
>>  	reg = <0x2d>;
>> -	label = "display_cluster";
>>  	enable-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
> 
> s/gpio/gpios/
> 
>>  	vled-supply = <&vbatt>;
>> +
>> +	backlight: backlight@0 {
>> +		label = "backlight_cluster";
>> +		linux,default-trigger = "backlight";
>> +	};
>>  }
>>  
>>  For more product information please see the link below:
>>
> 
