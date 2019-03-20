From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 4/4] leds: lm3532: Introduce the lm3532 LED driver
Date: Wed, 20 Mar 2019 20:00:27 +0100
Message-ID: <08406168-b20e-527f-23c7-e6543f5b5c10@gmail.com>
References: <20190313123249.17258-1-dmurphy@ti.com>
 <20190313123249.17258-4-dmurphy@ti.com>
 <8623d5bd-e369-9f90-a749-224119e5861b@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8623d5bd-e369-9f90-a749-224119e5861b@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, pavel@ucw.cz, tony@atomide.com, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Dan,

On 3/20/19 1:39 PM, Dan Murphy wrote:
> Hello
> 
> On 3/13/19 7:32 AM, Dan Murphy wrote:
>> Introduce the Texas Instruments LM3532 White LED driver.
>> The driver supports ALS configurability or manual brightness
>> control.
>>
>> The driver also supports associating LED strings with specific
>> control banks in a group or as individually controlled strings.
>>
> 
> I have a v5 series ready for posting and only the DT was reviewed.
> 
> Do we have any comments on the code?

I've just added one comment. After it is addressed please submit v5.

-- 
Best regards,
Jacek Anaszewski
