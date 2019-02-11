From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 0/2] Intel Cherry Trail Whiskey Cove LEDs support
Date: Mon, 11 Feb 2019 22:20:56 +0100
Message-ID: <21b0b6a3-0b5c-684e-adc4-06fa8bc958f6@gmail.com>
References: <20190209221213.24052-1-jekhor@gmail.com>
 <20190211115951.GC9224@smile.fi.intel.com> <20190211130554.GA10203@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211130554.GA10203@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Yauhen Kharuzhy <jekhor@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-Id: linux-leds@vger.kernel.org

On 2/11/19 2:05 PM, Pavel Machek wrote:
> On Mon 2019-02-11 13:59:51, Andy Shevchenko wrote:
>> On Sun, Feb 10, 2019 at 01:12:12AM +0300, Yauhen Kharuzhy wrote:
>>> This patch series introduces new driver for controlling LEDs connected
>>> to Intel Cherry Trail Whiskey Cove PMIC (general-purpose LED and charger
>>> status led). Only simple 'always on' and blinking modes are supported
>>> for now, no breathing.
>>>
>>> Driver was tested only with Lenovo Yoga Book notebook, and I don't have
>>> any documentation for the PMIC, so proposals and testing are welcome.
>>>
>>
>> I'm not sure you have a correct Cc list here. LED maintainers are
>> M:      Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> M:      Pavel Machek <pavel@ucw.cz>
>>
>> Also would be nice to cc to Hans de Goede.
> 
> I follow the list. I beileve Jacek does, too.

Right, there is no issue with that.

-- 
Best regards,
Jacek Anaszewski
