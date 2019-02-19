From: Stefan Mavrodiev <stefan@olimex.com>
Subject: Re: [PATCH v2 5/8] arm64: dts: allwinner: Enable AXP803 CHGLED for
 Olimex boards
Date: Tue, 19 Feb 2019 09:43:56 +0200
Message-ID: <d01f4cd2-67ef-66dc-4cb9-cad117bae90b@olimex.com>
References: <20190215115013.11098-1-stefan@olimex.com>
 <20190215115013.11098-6-stefan@olimex.com> <20190215184916.GA17897@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190215184916.GA17897@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Stefan Mavrodiev <stefan@olimex.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Lee Jones <lee.jones@linaro.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:X-POWERS MULTIFUNCTION PMIC DEVICE DRIVERS" <linux-kernel@vger.kernel.org>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-leds@vger.kernel.org


On 2/15/19 8:49 PM, Pavel Machek wrote:
> On Fri 2019-02-15 13:50:10, Stefan Mavrodiev wrote:
>> Teres-I and A64-OLinuXino commes with populated LED connected
>> to AXP803. So to be used as battery indication, pass the LED control
>> to the charger itself in mode 0 ( FULL while charging, OFF no battery
>> or completed).
>>
>> Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
>> ---
>>   arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts | 6 ++++++
>>   arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts   | 6 ++++++
>>   2 files changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
>> index f7a4bccaa5d4..7d6930319fba 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
>> @@ -177,6 +177,12 @@
>>   
>>   #include "axp803.dtsi"
>>   
>> +&axp_led {
>> +	label = "a64-olinuxino:yellow:chgled";
> There's little chance userspace will recognize this led.
>
> Can you make it "platform:yellow:charging" and fix it for other
> boards, too?

Sure.

Best regards,
Stefan Mavrodiev

>
> 									Pavel
