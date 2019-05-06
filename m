From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: mfd: LMU: Add the ramp up/down
 property
Date: Mon, 6 May 2019 12:53:25 -0500
Message-ID: <7712d911-7ef3-e273-2cdc-89c5b56369cb@ti.com>
References: <20190430191730.19450-1-dmurphy@ti.com>
 <20190430191730.19450-3-dmurphy@ti.com> <20190430220140.GB20410@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430220140.GB20410@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: linux-leds@vger.kernel.org

Pavel

On 4/30/19 5:01 PM, Pavel Machek wrote:
> On Tue 2019-04-30 14:17:25, Dan Murphy wrote:
>> Document the ramp-up and ramp-down property in the binding.
>> Removing the "sec" from the property definition as seconds is
>> implied.
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>
>> v3 - No changes added Reviewed-by Rob - https://lore.kernel.org/patchwork/patch/1058759/
>>
>> v2 - Fixed commit message as this was not just a modification but adding documentation
>> https://lore.kernel.org/patchwork/patch/1054504/
>>
>>  .../devicetree/bindings/mfd/ti-lmu.txt        | 20 ++++++++++++-------
>>  1 file changed, 13 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/ti-lmu.txt b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
>> index 86ca786d54fc..adae96c79d39 100644
>> --- a/Documentation/devicetree/bindings/mfd/ti-lmu.txt
>> +++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
>> @@ -25,6 +25,12 @@ Required properties:
>>  
>>  Optional property:
> 
> "properties".
> 

Ack

>>    - enable-gpios: A GPIO specifier for hardware enable pin.
>> +  - ramp-up-ms: Current ramping from one brightness level to
>> +		the a higher brightness level.
>> +		Range from 2048 us - 117.44 s
>> +  - ramp-down-ms: Current ramping from one brightness level to
>> +		  the a lower brightness level.
>> +		  Range from 2048 us - 117.44 s
> 
> Can you use ramp-up/down-us for consistency?

Sure I can change it to ramp-up/down-us.
I just converted it ramp-up/down-msec to ramp-ramp-up/down-ms.

Probably makes more sense anyway with the range actually given is in us.

Dan

> 								Pavel
> 
