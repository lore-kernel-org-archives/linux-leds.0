From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: More checks for patterns? was: Fix pattern handling optimalization
Date: Fri, 26 Oct 2018 16:02:10 +0800
Message-ID: <CAMz4kuLgV2Nz9yX3y=nT-_jiuFGSA+CY5g7EWQN4Yu-+oojH1g@mail.gmail.com>
References: <9794969ab8a5a6f62d8ac54cdebcaa3caedfc6d6.1539230481.git.baolin.wang@linaro.org>
 <d90397dd-429f-4f3f-307c-b69dccc360e0@gmail.com> <20181024083143.GA24165@amd>
 <bdadda71-f919-b6a6-4e1c-f87ed298b6b5@gmail.com> <20181024204439.GA32300@amd>
 <79c29d20-ae6a-4a12-28fa-93d7305a0623@gmail.com> <20181025212429.GB18016@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181025212429.GB18016@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, rteysseyre@gmail.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 26 October 2018 at 05:24, Pavel Machek <pavel@ucw.cz> wrote:
>
> We don't want brightness < 0, but this may not be best way to do
> this. We also don't want brightness > max_brightness, but I'm not sure
> this check is effective.

I think this is reasonable, but we can simplify the patch as:

diff --git a/drivers/leds/trigger/ledtrig-pattern.c
b/drivers/leds/trigger/ledtrig-pattern.c
index ce7acd1..3a4ecb9 100644
--- a/drivers/leds/trigger/ledtrig-pattern.c
+++ b/drivers/leds/trigger/ledtrig-pattern.c
@@ -250,10 +250,11 @@ static ssize_t
pattern_trig_store_patterns(struct led_classdev *led_cdev,

        while (offset < count - 1 && data->npatterns < MAX_PATTERNS) {
                cr = 0;
-               ccount = sscanf(buf + offset, "%d %u %n",
+               ccount = sscanf(buf + offset, "%u %u %n",
                                &data->patterns[data->npatterns].brightness,
                                &data->patterns[data->npatterns].delta_t, &cr);
-               if (ccount != 2) {
+               if (ccount != 2 ||
+                   data->patterns[data->npatterns].brightness >
data->led_cdev->max_brightness) {
                        data->npatterns = 0;
                        err = -EINVAL;
                        goto out;

>
> We probably also don't want pattern where all the delta_t s are zero.

Yes. Maybe add one function to valid the patterns.

>
> I came up with this so far....
>                                                             Pavel
>
>
>
> diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/ledtrig-pattern.c
> index ce7acd1..bc5f495 100644
> --- a/drivers/leds/trigger/ledtrig-pattern.c
> +++ b/drivers/leds/trigger/ledtrig-pattern.c
> @@ -250,9 +251,16 @@ static ssize_t pattern_trig_store_patterns(struct led_classdev *led_cdev,
>
>         while (offset < count - 1 && data->npatterns < MAX_PATTERNS) {
>                 cr = 0;
> -               ccount = sscanf(buf + offset, "%d %u %n",
> +               ccount = sscanf(buf + offset, "%u %u %n",
>                                 &data->patterns[data->npatterns].brightness,
>                                 &data->patterns[data->npatterns].delta_t, &cr);
> +
> +               if (data->patterns[data->npatterns].brightness > data->led_cdev->max_brightness) {
> +                       data->npatterns = 0;
> +                       err = -EINVAL;
> +                       goto out;
> +               }
> +
>                 if (ccount != 2) {
>                         data->npatterns = 0;
>                         err = -EINVAL;
>
>
>
>
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html



-- 
Baolin Wang
Best Regards
