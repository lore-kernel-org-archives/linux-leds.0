From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v4 1/4] dt: lm3532: Add lm3532 dt doc and update ti_lmu
 doc
Date: Thu, 14 Mar 2019 07:52:04 -0500
Message-ID: <75def574-5fe4-46c0-664f-8c6583b69668@ti.com>
References: <20190313123249.17258-1-dmurphy@ti.com>
 <20190314093912.GA10637@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190314093912.GA10637@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, tony@atomide.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hello

On 3/14/19 4:39 AM, Pavel Machek wrote:
> Hi!
> 
> Could you maybe slow down a bit.
> 
> "Hey, I should review this". "Hmm, there are two new versions in the
> mailbox in the meantime, good thing I waited."
> 

Yes.  I am going to hold off on v5 until the code gets reviewed.

>> +	ramp-up-ms = <1024>;
>> +	ramp-down-ms = <65536>;
> 
> This is wrong.
> 

Ack.  Changed in it in the example I deleted.

>> +	led@1 {
>> +		reg = <1>;
>> +		led-sources = <1>;
>> +		ti,led-mode = <0>;
>> +		label = "keypad";
> 
> "platform::kbd_backlight"

Being an example does it have to match DT contents?

I can change it since I have to touch the file anyway.

Dan


> 									Pavel
> 


-- 
------------------
Dan Murphy
