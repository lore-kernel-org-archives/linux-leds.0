From: "Wu Fenglin" <fenglinw@codeaurora.org>
Subject: RE: [PATCH V1 1/2] leds: leds-qti-rgb: Add LED driver for QTI TRI_LED module
Date: Wed, 31 May 2017 16:23:28 +0800
Message-ID: <001301d2d9e7$3102b720$93082560$@codeaurora.org>
References: <20170531061541.10808-1-fenglinw@codeaurora.org> <20170531061541.10808-2-fenglinw@codeaurora.org> <20170531075536.GA13028@amd>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170531075536.GA13028@amd>
Content-Language: en-us
Sender: linux-kernel-owner@vger.kernel.org
To: 'Pavel Machek' <pavel@ucw.cz>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 'Richard Purdie' <rpurdie@rpsys.net>, 'Jacek Anaszewski' <jacek.anaszewski@gmail.com>, 'Rob Herring' <robh+dt@kernel.org>, 'Mark Rutland' <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, subbaram@quicinc.com, aghayal@qti.qualcomm.com, wruan@quicinc.com, kgunda@qti.qualcomm.com
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

Thanks for the reviewing.

For the order, the hardware register mapping has this order (blue/green/red)
from bit0/1/2, I can revert it to (red/green/blue) if there is a strong
concern.

For these two properties: qcom,off-ms/ qcom,on-ms, I am using them to assign
the default blinking on/off time, then the LEDs would have a default
blinking pattern if you do "echo 1 > /sys/class/leds/red/blink"

Fenglin Wu

-----Original Message-----
From: Pavel Machek [mailto:pavel@ucw.cz] 
Sent: Wednesday, May 31, 2017 3:56 PM
To: fenglinw@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org; linux-kernel@vger.kernel.org; Richard
Purdie <rpurdie@rpsys.net>; Jacek Anaszewski <jacek.anaszewski@gmail.com>;
Rob Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
linux-leds@vger.kernel.org; devicetree@vger.kernel.org;
subbaram@quicinc.com; aghayal@qti.qualcomm.com; wruan@quicinc.com;
kgunda@qti.qualcomm.com
Subject: Re: [PATCH V1 1/2] leds: leds-qti-rgb: Add LED driver for QTI
TRI_LED module

Hi!

> +- qcom,support-blink:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: An array of integer values to indicate if "blue",
"green", "red"
> +		LEDs support blink control. The values are listed as the
fixed
> +		order for "blue", "green", "red" LEDs.

Normal order is RGB, and no need for the "s.

> +- qcom,on-ms:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: An array of time values (milli-seconds) to represent the
> +		on duration for "blue", "green", "red" LEDs. The values are
> +		listed as the fixed order for "blue", "green", "red" LEDs.
> +		This property has to be defined if "qcom,support-blink" is
> +		present.
> +
> +- qcom,off-ms:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: An array of time values (milli-seconds) to represent the
> +		off duration for "blue", "green", "red" LEDs. The values are
> +		listed as the fixed order for "blue", "green", "red" LEDs.
> +		This property has to be defined if "qcom,support-blink" is
> +		present.

I don't get it; why is this needed?

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures)
http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
