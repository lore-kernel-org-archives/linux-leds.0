From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 0/5] leds: trigger: Add pattern initialization from
 Device Tree
Date: Wed, 12 Dec 2018 20:18:27 +0100
Message-ID: <da3780eb-c4b4-5a1b-8f6d-eff1c0e98d7f@gmail.com>
References: <1544434201-14190-1-git-send-email-krzk@kernel.org>
 <be526095-5af9-38bb-7c72-629a82d318e0@gmail.com> <20181212121604.GA11088@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212121604.GA11088@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 12/12/18 1:16 PM, Pavel Machek wrote:
> On Mon 2018-12-10 22:03:18, Jacek Anaszewski wrote:
>> Hi Krzysztof,
>>
>> Thank you for the update.
>>
>> On 12/10/18 10:29 AM, Krzysztof Kozlowski wrote:
>>> Hi,
>>>
>>> I rebased on top of Jacek's patches and, as I could not find them on git kernel
>>> tree, I included them here. Also with small fixup.
>>>
>>> Changes since v1:
>>> 1. Rebase on Jacek's patches.
>>
>> Made following amendments to 2/5:
>>
>> - removed extra empty line
>> - fixed language in the commit message as proposed by Pavel
>>
>>> 2. Add patch 3/5 for fixup of Jacek's solution.
>>> 3. Drop first two patches from the series (applied).
>>> 4. Patch 5/5: Use LED_INIT_DEFAULT_TRIGGER (suggested by Jacek Anaszewski).
>>> 5. Patch 5/5: Return-on-error and log warning (suggested by Pavel Machek)
>> Applied to the for-next branch of linux-leds.git, thanks.
>>
>> Pavel - I'm still awaiting your acks, just wanted to have
>> the patch set in linux-next quicker, taking into account that
>> merge window is imminent.
> 
> Ok, let me take a look. But this really should have Rob's acknowledge,
> so...

Dropped 4/5 and 5/5 as they are now superseded by v3, that appears
not to be the final too.

-- 
Best regards,
Jacek Anaszewski
