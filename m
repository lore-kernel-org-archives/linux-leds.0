From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] dt: leds-lm36274.txt: fix a broken reference to
 ti-lmu.txt
Date: Mon, 17 Jun 2019 08:45:04 -0500
Message-ID: <a15bace8-90a8-4201-86af-9fb464024f0a@ti.com>
References: <79b9bf3388eb231da77c6a804862d21339262d0a.1560421387.git.mchehab+samsung@kernel.org>
 <20190617131220.GD21113@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617131220.GD21113@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


On 6/17/19 8:12 AM, Pavel Machek wrote:
> On Thu 2019-06-13 07:23:15, Mauro Carvalho Chehab wrote:
>> There's a typo there:
>> 	ti_lmu.txt -> ti-lmu.txt
>>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
Acked-by: Dan Murphy <dmurphy@ti.com>
>
>> @@ -6,7 +6,7 @@ up to 29V total output voltage. The 11-bit LED current is programmable via
>>   the I2C bus and/or controlled via a logic level PWM input from 60 uA to 30 mA.
>>   
>>   Parent device properties are documented in
>> -Documentation/devicetree/bindings/mfd/ti_lmu.txt
>> +Documentation/devicetree/bindings/mfd/ti-lmu.txt
>>   
>>   Regulator properties are documented in
>>   Documentation/devicetree/bindings/regulator/lm363x-regulator.txt
