From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 2/9] dt-bindings: ti-lmu: Remove LM3697
Date: Thu, 11 Oct 2018 21:38:53 +0200
Message-ID: <8c1559e1-b703-4c98-8bd9-7c9993bd59f5@gmail.com>
References: <20181011165123.32198-1-dmurphy@ti.com>
 <20181011165123.32198-3-dmurphy@ti.com> <20181011182734.GA7973@amd>
 <4fcb91c7-b2b2-798d-8a41-fa1b475086e0@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4fcb91c7-b2b2-798d-8a41-fa1b475086e0@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, lee.jones@linaro.org, tony@atomide.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 10/11/2018 08:34 PM, Dan Murphy wrote:
> Pavel
> 
> On 10/11/2018 01:27 PM, Pavel Machek wrote:
>> On Thu 2018-10-11 11:51:16, Dan Murphy wrote:
>>> Remove support for the LM3697 LED device
>>> from the ti-lmu.  The LM3697 will be supported
>>> via a stand alone LED driver.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>
>> NAK.
> 
> Thanks for the NAK.
> 
> This NAK was NAK'd by other maintainer in the V2 RFC patchset
> 
> https://lore.kernel.org/patchwork/patch/993171/

I confirm. LM3697 is a standalone device and not a cell of any
MFD device.

Waiting for DT maintainer's ack.

Best regards,
Jacek Anaszewski
								
>>> index c885cf89b8ce..920f910be4e9 100644
>>> --- a/Documentation/devicetree/bindings/mfd/ti-lmu.txt
>>> +++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
>>> @@ -9,7 +9,6 @@ TI LMU driver supports lighting devices below.
>>>    LM3632       Backlight and regulator
>>>    LM3633       Backlight, LED and fault monitor
>>>    LM3695       Backlight
>>> -  LM3697       Backlight and fault monitor
>>>  
>>>  Required properties:
>>>    - compatible: Should be one of:
>>> @@ -18,11 +17,10 @@ Required properties:
>>>                  "ti,lm3632"
>>>                  "ti,lm3633"
>>>                  "ti,lm3695"
>>> -                "ti,lm3697"
>>>    - reg: I2C slave address.
>>>           0x11 for LM3632
>>>           0x29 for LM3631
>>> -         0x36 for LM3633, LM3697
>>> +         0x36 for LM3633
>>>           0x38 for LM3532
>>>           0x63 for LM3695
>>>  
>>> @@ -38,7 +36,6 @@ Optional nodes:
>>>      Required properties:
>>>        - compatible: Should be one of:
>>>                      "ti,lm3633-fault-monitor"
>>> -                    "ti,lm3697-fault-monitor"
>>>    - leds: LED properties for LM3633. Please refer to [2].
>>>    - regulators: Regulator properties for LM3631 and LM3632.
>>>                  Please refer to [3].
>>> @@ -220,24 +217,3 @@ lm3695@63 {
>>>  		};
>>>  	};
>>>  };
>>> -
>>> -lm3697@36 {
>>> -	compatible = "ti,lm3697";
>>> -	reg = <0x36>;
>>> -
>>> -	enable-gpios = <&pioC 2 GPIO_ACTIVE_HIGH>;
>>> -
>>> -	backlight {
>>> -		compatible = "ti,lm3697-backlight";
>>> -
>>> -		lcd {
>>> -			led-sources = <0 1 2>;
>>> -			ramp-up-msec = <200>;
>>> -			ramp-down-msec = <200>;
>>> -		};
>>> -	};
>>> -
>>> -	fault-monitor {
>>> -		compatible = "ti,lm3697-fault-monitor";
>>> -	};
>>> -};
>>
> 
> 
