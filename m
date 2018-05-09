From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add SC27xx breathing light
 controller documentation
Date: Wed, 9 May 2018 22:09:25 +0200
Message-ID: <c7e433a2-f7cf-c748-4fb8-209bfb245573@gmail.com>
References: <f393ca5a99059e7086307b99fc435777fe09018b.1525757122.git.baolin.wang@linaro.org>
 <20180509142526.GA25131@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180509142526.GA25131@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Baolin Wang <baolin.wang@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, xiaotong.lu@spreadtrum.com, broonie@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 05/09/2018 04:25 PM, Pavel Machek wrote:
> Hi!
> 
>> This patch adds the binding documentation for Spreadtrum SC27xx series
>> breathing light controller, which supports 3 outputs: red LED, green
>> LED and blue LED.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
>> ---
>> Changes since v1:
>>   - Change the compatible string to be one explicit SoC name.
>>   - Change the child node name.
>>   - Change to be upper case for the first character.
>> ---
>>   .../devicetree/bindings/leds/leds-sc27xx-bltc.txt  |   41 ++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt b/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
>> new file mode 100644
>> index 0000000..b3de7fc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
>> @@ -0,0 +1,41 @@
>> +LEDs connected to Spreadtrum SC27XX PMIC breathing light controller
>> +
>> +The SC27xx breathing light controller supports to 3 outputs:
>> +red LED, green LED and blue LED. Each LED can work at normal
>> +PWM mode or breath light mode.
> 
>> +Required properties:
>> +- compatible: Should be "sprd,sc2731-bltc".
> 
> If this is for 2731, I'd say so in the title and the filename...?

Not necessarily, since apparently it is possible that other compatibles
might be added to it in the future.

> 
>> +- #address-cells: Must be 1.
>> +- #size-cells: Must be 0.
>> +- reg: Specify controller address.
> 
> the controller...
> 
>> +Required child properties:
>> +- reg: Number of LED line (could be from 0 to 2).
> 
> Uff. "Port this LED is connected to"?
> 
> With that fixed...
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> 
> 									Pavel
> 

-- 
Best regards,
Jacek Anaszewski
