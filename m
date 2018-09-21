From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v12 1/2] leds: core: Introduce LED pattern trigger
Date: Sat, 22 Sep 2018 00:11:29 +0200
Message-ID: <ccac8e5f-e122-9f7d-aa43-fa89c79cb1fe@gmail.com>
References: <67ebebf02edd6d8ee42a13b139733e9cc680ea86.1536631975.git.baolin.wang@linaro.org>
 <CAMz4kuJx9twJ=wM5qsucV3JH_VS-AC1aWMqpQOwAMkCuKBHLRg@mail.gmail.com>
 <324778a9-a32c-ae6e-337a-39845f214bfc@gmail.com> <20180921211758.GC18062@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921211758.GC18062@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Baolin Wang <baolin.wang@linaro.org>, rteysseyre@gmail.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 09/21/2018 11:17 PM, Pavel Machek wrote:
> On Fri 2018-09-21 22:59:40, Jacek Anaszewski wrote:
>> Hi Baolin,
>>
>> On 09/21/2018 05:31 AM, Baolin Wang wrote:
>>> Hi Jacek and Pavel,
>>>
>>> On 11 September 2018 at 10:47, Baolin Wang <baolin.wang@linaro.org> wrote:
>>>> This patch adds one new led trigger that LED device can configure
>>>> the software or hardware pattern and trigger it.
>>>>
>>>> Consumers can write 'pattern' file to enable the software pattern
>>>> which alters the brightness for the specified duration with one
>>>> software timer.
>>>>
>>>> Moreover consumers can write 'hw_pattern' file to enable the hardware
>>>> pattern for some LED controllers which can autonomously control
>>>> brightness over time, according to some preprogrammed hardware
>>>> patterns.
>>>>
>>>> Signed-off-by: Raphael Teysseyre <rteysseyre@gmail.com>
>>>> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> 
>>> Do you have any comments for the v12 patch set? Thanks.
>>
>> We will probably have to remove hw_pattern from ledtrig-pattern
>> since we are unable to come up with generic interface for it.
>> Unless thread [0] will end up with some brilliant ideas. So far
>> we're waiting for Pavel's reply.
>>
>> [0] https://lkml.org/lkml/2018/9/13/1216
> 
> To paint a picture:
> 
> brightness
> 
>    rise hold          lower       hold down
>   ^    XXXXXXXXXXXXXXX
>   |   X               XX
>   |  X                  XX
>   | X                     XXXXXXXXXXXXXXXXXXXXXXXXXX
>   +-------------------------------------------------------> time
> 
> This is what Baolin's hardware can do, right?
> 
> This is also what pattern trigger can do, right?
> 
> So all we need to do is match the two interfaces, so that hw_pattern
> returns -EINVAL on patterns hardware can not actually do.
> 
> I believe I described code to do that in [0] above.

You said that we should get the same effect by writing the
same series of tuples to either pattern or hw_pattern file.

Below command consists of four tuples (marked with brackets
to highlight), and it will activate breathing mode in Baolin's
hw_pattern:

"[0 rise_duration] [brightness high_duration] [brightness fall_duration]
[0   low_duration]"

Now, I can't see how these four tuples could force the software
fallback to produce breathing effect you depicted.

-- 
Best regards,
Jacek Anaszewski
