From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] dt: bindings: as3645a: Fix the example node
Date: Wed, 6 Dec 2017 16:32:36 -0600
Message-ID: <2c2b1fc0-6156-2897-b597-6911fee64556@ti.com>
References: <20171205133637.30022-1-dmurphy@ti.com>
 <20171206215204.7qyjjd2oue7n7l37@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171206215204.7qyjjd2oue7n7l37@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Rob

On 12/06/2017 03:52 PM, Rob Herring wrote:
> On Tue, Dec 05, 2017 at 07:36:37AM -0600, Dan Murphy wrote:
>> Fix the address-cells and size-cells example node
>> to reflect to the correct representation.
>>
>> Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/leds/ams,as3645a.txt | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/ams,as3645a.txt b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
>> index fdc40e354a64..8a49ccfec29b 100644
>> --- a/Documentation/devicetree/bindings/leds/ams,as3645a.txt
>> +++ b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
>> @@ -59,8 +59,8 @@ Example
>>  =======
>>  
>>  	as3645a@30 {
>> -		#address-cells: 1
>> -		#size-cells: 0
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>>  		reg = <0x30>;
>>  		compatible = "ams,as3645a";
> 
> Convention is also we put compatible first.
> 

OK I will move that too for v2.

Can that be in the same patch or do you want a separate patch?

Dan

>>  		flash@0 {
>> -- 
>> 2.15.0.124.g7668cbc60
>>


-- 
------------------
Dan Murphy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
