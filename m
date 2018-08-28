From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 1/2] leds: core: Introduce LED pattern trigger
Date: Tue, 28 Aug 2018 13:47:49 -0700
Message-ID: <20180828204749.GH2523@minitux>
References: <1dc5d394324b2bf1ffe229b8e42691fab6d749e0.1533556992.git.baolin.wang@linaro.org>
 <c18fd41f-831c-ab74-57e5-d4151f4b47cc@gmail.com>
 <20180824101145.GA1510@amd>
 <9bb7ac19-36a6-d11a-6d46-fc65c2026201@gmail.com>
 <20180824201227.GB17146@amd>
 <f5046e2d-9f15-4b7e-083e-e97f7ca0693c@gmail.com>
 <CAMz4kuLubD6v1+zmjuKtBL4geBk4ofBdkMy+v8x0K5g_L0otqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMz4kuLubD6v1+zmjuKtBL4geBk4ofBdkMy+v8x0K5g_L0otqQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, rteysseyre@gmail.com, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Sat 25 Aug 00:51 PDT 2018, Baolin Wang wrote:

> On 25 August 2018 at 04:44, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> > On 08/24/2018 10:12 PM, Pavel Machek wrote:
> >> On Fri 2018-08-24 21:49:50, Jacek Anaszewski wrote:
> >>> Hi Pavel,
> >>>
> >>> On 08/24/2018 12:11 PM, Pavel Machek wrote:
[..]
> >>> +    if (led_cdev->pattern_set) {
> >>> +            return led_cdev->pattern_set(led_cdev, data->patterns,
> >>> +                                         data->npatterns, data->repeat);
> >>> +    }
> >>
> >> Yeah, that sounds wrong. (Sorry I did not pay enough attention).
> >>
> >> It pattern_set() returns special error code, it should just continue
> >> and use software pattern fallback.
> >
> > And now we can get back to the issue I was concerned about in the
> > email you replied to, i.e. what series of [brightness delta_t] tuples
> > should be written to the pattern file to enable hardware breathing
> > engine.
> 
> OK. So now we've made a consensus to use the software pattern fallback
> if failed to set hardware pattern. How about introduce one interface
> to convert hardware patterns to software patterns if necessary?
> 

I do not agree that a silent fallback mechanism is the way to go here.
There is a enormous difference in power consumption between letting a
dedicated piece of hardware drive a pulse on a LED or using a general
purpose ARM core running at hundreds of MHz.


Note that the most common use case for the driver I'm trying to upstream
is to pulse the LED when you have a notification pending on your Android
device, in which case you want all the CPUs are completely powered down.

Regards,
Bjorn
