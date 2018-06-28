From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/2] leds: core: Introduce generic pattern interface
Date: Thu, 28 Jun 2018 11:31:46 +0300
Message-ID: <CAHp75Vfmr=VRtQaUWk4i8A2sws2sDS=QL3wTMfHTszrniAv-YA@mail.gmail.com>
References: <03bc9a51ccae38cdc86934746aee9f75ec667cfd.1530162340.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <03bc9a51ccae38cdc86934746aee9f75ec667cfd.1530162340.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Thu, Jun 28, 2018 at 8:16 AM, Baolin Wang <baolin.wang@linaro.org> wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Some LED controllers have support for autonomously controlling
> brightness over time, according to some preprogrammed pattern or
> function.
>
> This adds a new optional operator that LED class drivers can implement
> if they support such functionality as well as a new device attribute to
> configure the pattern for a given LED.

> +What: /sys/class/leds/<led>/pattern
> +Date: June 2018
> +KernelVersion: 4.18

4.19 ?

> +static ssize_t pattern_show(struct device *dev,
> +                           struct device_attribute *attr, char *buf)
> +{
> +       struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +       struct led_pattern *pattern;
> +       size_t offset = 0;
> +       int count, n, i;

> +       if (!led_cdev->pattern_get)
> +               return -EOPNOTSUPP;
> +

Perhaps just hide an attribute completely?

> +       pattern = led_cdev->pattern_get(led_cdev, &count);
> +       if (IS_ERR_OR_NULL(pattern))
> +               return PTR_ERR(pattern);

Hmm.. Here you shadow NULL case by returning 0.
Even if it's correct behaviour IS_ERR_OR_NULL is a beast to hide such
subtle detail.

It also would be good idea to check for count == 0 and bail out
immediately. Otherwise you will print an extra blank line.

> +       for (i = 0; i < count; i++) {
> +               n = snprintf(buf + offset, PAGE_SIZE - offset, "%d %d",
> +                            pattern[i].brightness, pattern[i].delta_t);
> +

> +               if (offset + n >= PAGE_SIZE)
> +                       goto err_nospc;

> +
> +               offset += n;
> +

> +               if (i < count - 1)
> +                       buf[offset++] = ' ';

You might add this to the end of above format string and remove this
conditional completely...

> +       }
> +

> +       buf[offset++] = '\n';

...and use here something like

buf[offset - 1] = '\n';

(we have such patterns in the kernel)

> +
> +       kfree(pattern);
> +       return offset;
> +
> +err_nospc:
> +       kfree(pattern);
> +       return -ENOSPC;
> +}
> +
> +static ssize_t pattern_store(struct device *dev,
> +                            struct device_attribute *attr,
> +                            const char *buf, size_t size)
> +{
> +       struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +       struct led_pattern *pattern = NULL;
> +       unsigned long val;
> +       char *sbegin;
> +       char *elem;
> +       char *s;
> +       int ret, len = 0;
> +       bool odd = true;
> +
> +       s = sbegin = kstrndup(buf, size, GFP_KERNEL);
> +       if (!s)
> +               return -ENOMEM;
> +

> +       /* Trim trailing newline */
> +       s[strcspn(s, "\n")] = '\0';

It's usually done via strstrip().

sbegin = kstrndup();
...

s = strstrip(sbegin);

> +
> +       /* If the remaining string is empty, clear the pattern */
> +       if (!s[0]) {

if (!*s) ?

> +               ret = led_cdev->pattern_clear(led_cdev);
> +               goto out;
> +       }
> +
> +       pattern = kcalloc(size, sizeof(*pattern), GFP_KERNEL);
> +       if (!pattern) {
> +               ret = -ENOMEM;
> +               goto out;
> +       }
> +
> +       /* Parse out the brightness & delta_t touples */
> +       while ((elem = strsep(&s, " ")) != NULL) {
> +               ret = kstrtoul(elem, 10, &val);
> +               if (ret)
> +                       goto out;
> +

> +               if (odd) {

This is effectivelly if (len % 2 == 0)

> +                       pattern[len].brightness = val;
> +               } else {
> +                       pattern[len].delta_t = val;
> +                       len++;
> +               }
> +
> +               odd = !odd;
> +       }
> +
> +       /*
> +        * Fail if we didn't find any data points or last data point was partial
> +        */
> +       if (!len || !odd) {
> +               ret = -EINVAL;
> +               goto out;
> +       }

For partial data can we return different error code?
Does it make sense?

> +
> +       ret = led_cdev->pattern_set(led_cdev, pattern, len);
> +
> +out:
> +       kfree(pattern);
> +       kfree(sbegin);
> +       return ret < 0 ? ret : size;
> +}
> +static DEVICE_ATTR_RW(pattern);


-- 
With Best Regards,
Andy Shevchenko
