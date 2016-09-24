From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 1/2] leds: ncp5623: Add device tree binding
 documentation
Date: Sat, 24 Sep 2016 21:06:51 +0200
Message-ID: <bd220063-5c66-c428-738f-0eeb5f4f0bc7@gmail.com>
References: <1474025672-5040-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1474025672-5040-2-git-send-email-florian.vaussard@heig-vd.ch>
 <20160924115823.GA8696@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160924115823.GA8696@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Florian Vaussard <florian.vaussard@gmail.com>
Cc: devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Florian Vaussard <florian.vaussard@heig-vd.ch>
List-Id: linux-leds@vger.kernel.org

On 09/24/2016 01:58 PM, Pavel Machek wrote:
> Hi!
>
>> +Example
>> +=======
>> +
>> +led1: ncp5623@38 {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	compatible = "onnn,ncp5623";
>> +	reg = <0x38>;
>> +	onnn,led-iref-microamp = <10>;
>> +
>> +	led1r@0 {
>> +		label = "ncp:power:red";
>> +		linux,default-trigger = "default-on";
> ...
>> +	led1b@1 {
>> +		label = "ncp:power:blue";
>> +		reg = <1>;
>
> Actually... the three LEDs are packaged such as this is one colorful
> light to the user, right? Some day we'll need to group them, so that
> kernel can automatically tell this is one led, and probably add extra
> attributes, such as values that produce white light.

We could try out the trigger approach we discussed few months ago.
Unfortunately I currently don't have enough time to propose the
implementation. Probably this work could be done on the occasion of
addition of RGB LED class driver like this, if the author had free
bandwidth for that.

-- 
Best regards,
Jacek Anaszewski
