From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 5/6] dt-bindings: leds: Add LED bindings for the LM36274
Date: Wed, 10 Apr 2019 06:37:18 -0500
Message-ID: <84566e9f-f00a-0984-0279-67e49a2d9331@ti.com>
References: <20190405145540.27703-1-dmurphy@ti.com>
 <20190405145540.27703-6-dmurphy@ti.com> <20190408101039.GC30958@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408101039.GC30958@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Pavel


On 4/8/19 5:10 AM, Pavel Machek wrote:
> On Fri 2019-04-05 09:55:39, Dan Murphy wrote:
>> Add the LM36274 LED specific bindings.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../devicetree/bindings/leds/leds-lm36274.txt | 82 +++++++++++++++++++
>>   1 file changed, 82 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lm36274.txt b/Documentation/devicetree/bindings/leds/leds-lm36274.txt
>> new file mode 100644
>> index 000000000000..359990d85b28
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-lm36274.txt
>> @@ -0,0 +1,82 @@
>> +* Texas Instruments LM36274 4-Channel LCD Backlight Driver w/Integrated Bias
>> +
>> +The LM36274 is an integrated four-channel WLED driver and LCD bias supply.
>> +The backlight boost provides the power to bias four parallel LED strings with
>> +up to 29-V total output voltage. The 11-bit LED current is rogrammable via
> 29V
>
Ack


> 								Pavel
