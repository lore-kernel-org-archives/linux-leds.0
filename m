From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: RGB LED class Re: [PATCH v2 2/2] leds: lp50xx: Add the LP50XX
 family of the RGB LED driver
Date: Mon, 21 Jan 2019 20:38:12 +0100
Message-ID: <e03a96ea-6597-936e-59e0-a9cd7df30525@gmail.com>
References: <20190114211723.11186-1-dmurphy@ti.com>
 <20190114211723.11186-2-dmurphy@ti.com>
 <ce911fdf-c7c2-63e8-5c7a-b0be965ab69b@gmail.com> <20190115222223.GA17363@amd>
 <79394d17-3124-75b2-ccac-dc1046499d14@ti.com> <20190116105537.GA1803@amd>
 <86299268-3202-814a-134b-04bd2170faab@ti.com>
 <8dfa2854-2814-6874-ab8e-1858e9a18acf@gmail.com> <20190118000235.GB27661@amd>
 <61fa89eb-c12e-8f9c-9457-9d6d17ba7717@gmail.com> <20190119213629.GA3654@amd>
 <9d2e0220-69f0-faaa-adb9-13d905f9c51d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9d2e0220-69f0-faaa-adb9-13d905f9c51d@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dachaac@gmail.com, robh+dt@kernel.org
List-Id: linux-leds@vger.kernel.org

On 1/20/19 4:30 PM, Jacek Anaszewski wrote:
> On 1/19/19 10:36 PM, Pavel Machek wrote:
>> Hi!
[...]
>> I want to make sure userspace understands this has linear relation to
>> output power. I'd like to avoid mentioning color because there power
>> output is not linear with "RGB"
>>
>>> s/pwm/color/
>>
>> s/pwm/power/ would work for me.
> 
> Power implies physical units. I'd prefer "intensity".

Hmm, intensity_channels does not look too informative...

OK, so let's stick to power_channels, at least for time being.
Maybe some better ideas will have appeared before the final
solution is merged.

-- 
Best regards,
Jacek Anaszewski
