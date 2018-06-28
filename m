From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/2] leds: core: Introduce generic pattern interface
Date: Thu, 28 Jun 2018 13:24:26 +0300
Message-ID: <CAHp75VdAXR5=wmfEmF7pwOhZV+P-hOTPdCMFPvwCCqyACnQqpw@mail.gmail.com>
References: <03bc9a51ccae38cdc86934746aee9f75ec667cfd.1530162340.git.baolin.wang@linaro.org>
 <CAHp75Vfmr=VRtQaUWk4i8A2sws2sDS=QL3wTMfHTszrniAv-YA@mail.gmail.com> <CAMz4kuKOnXX5cf36UZu91f7M9y6NL2Q-CkAxf=VnqawmcQ3tGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMz4kuKOnXX5cf36UZu91f7M9y6NL2Q-CkAxf=VnqawmcQ3tGg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Thu, Jun 28, 2018 at 12:18 PM, Baolin Wang <baolin.wang@linaro.org> wrote:
> On 28 June 2018 at 16:31, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>> On Thu, Jun 28, 2018 at 8:16 AM, Baolin Wang <baolin.wang@linaro.org> wrote:

>>> +What: /sys/class/leds/<led>/pattern
>>> +Date: June 2018
>>> +KernelVersion: 4.18
>>
>> 4.19 ?
>
> I think this will be merged in 4.18.

Is it bug fix? I don't see how it would make v4.18.

>>> +static ssize_t pattern_show(struct device *dev,
>>> +                           struct device_attribute *attr, char *buf)
>>> +{
>>> +       struct led_classdev *led_cdev = dev_get_drvdata(dev);
>>> +       struct led_pattern *pattern;
>>> +       size_t offset = 0;
>>> +       int count, n, i;
>>
>>> +       if (!led_cdev->pattern_get)
>>> +               return -EOPNOTSUPP;
>>> +
>>
>> Perhaps just hide an attribute completely?
>
> Driver need implement the pattern_get() interface, otherwise we can
> not get any available pattern values to show.

It doesn't contradict with what I said. I proposed to just hide an
attribute from sysfs completely if there is no such callbacks
available.

>>> +       pattern = led_cdev->pattern_get(led_cdev, &count);
>>> +       if (IS_ERR_OR_NULL(pattern))
>>> +               return PTR_ERR(pattern);
>>
>> Hmm.. Here you shadow NULL case by returning 0.
>> Even if it's correct behaviour IS_ERR_OR_NULL is a beast to hide such
>> subtle detail.
>>
>> It also would be good idea to check for count == 0 and bail out
>> immediately. Otherwise you will print an extra blank line.
>
> We can not check count, since count can be not initialized if failed
> to call pattern_get(). So maybe force user to return error pointer,
> and we just check like:
> if (IS_ERR(pattern))
>         return PTR_ERR(pattern);

My question is can be counter 0 by some reason?

>>> +       for (i = 0; i < count; i++) {
>>> +               n = snprintf(buf + offset, PAGE_SIZE - offset, "%d %d",
>>> +                            pattern[i].brightness, pattern[i].delta_t);
>>> +
>>
>>> +               if (offset + n >= PAGE_SIZE)
>>> +                       goto err_nospc;
>>
>>> +
>>> +               offset += n;
>>> +
>>
>>> +               if (i < count - 1)
>>> +                       buf[offset++] = ' ';
>>
>> You might add this to the end of above format string and remove this
>> conditional completely...
>
> Hmmm, I do not think we need add one extra ' ' to the end of format string.

Why not? You do it anyway for all except last, but...

>>> +       buf[offset++] = '\n';
>>
>> ...and use here something like
>>
>> buf[offset - 1] = '\n';
>
> I don't think so. We need increase the offset value at the same time.

Nope, you don't need it. here we replace trailing space by '\n'.

>> (we have such patterns in the kernel)

...look at existing patterns in the kernel.

>>> +       /* Trim trailing newline */
>>> +       s[strcspn(s, "\n")] = '\0';
>>
>> It's usually done via strstrip().
>>
>> sbegin = kstrndup();
>> ...
>>
>> s = strstrip(sbegin);
>
> Good idea, will change.

Replying to your another message. And who cares about leading spaces?
Is it wrong to have them? Why?

>>> +       /* Parse out the brightness & delta_t touples */
>>> +       while ((elem = strsep(&s, " ")) != NULL) {
>>> +               ret = kstrtoul(elem, 10, &val);
>>> +               if (ret)
>>> +                       goto out;
>>> +
>>
>>> +               if (odd) {
>>
>> This is effectivelly if (len % 2 == 0)
>
> It is incorrect, we can not use len to decide the value is brightness
> or delta. Here logical is to make sure we must keep <brightness
> delta>, <brightness, delta> ......

Right, the problem is the format itself I suppose.
It's too error prone for one attribute.

What about to change it like

"brightness delta[, brightness delta[, ...]]"

and then you do

...elem = strsep(&s, ",")...

sscanf("%d %d") == 2

?

>>> +                       pattern[len].brightness = val;
>>> +               } else {
>>> +                       pattern[len].delta_t = val;
>>> +                       len++;
>>> +               }
>>> +
>>> +               odd = !odd;
>>> +       }
>>> +
>>> +       /*
>>> +        * Fail if we didn't find any data points or last data point was partial
>>> +        */
>>> +       if (!len || !odd) {
>>> +               ret = -EINVAL;
>>> +               goto out;
>>> +       }
>>
>> For partial data can we return different error code?
>> Does it make sense?
>
> Sorry I did not get you here. If user set incorrect pattern values, I
> think '-EINVAL' is suitable.

OK.

-- 
With Best Regards,
Andy Shevchenko
