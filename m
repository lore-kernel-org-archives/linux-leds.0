From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v3 1/2] leds: core: Introduce generic pattern interface
Date: Fri, 27 Jul 2018 16:41:15 +0800
Message-ID: <CAMz4kuLLf84ZnxEVowCFnj9NGGU8zD39A-Oeqr+cbFSuBc1xOw@mail.gmail.com>
References: <2c3a8911-150a-9b25-2a66-a9432047f96b@lechnology.com>
 <68996338-a902-2b57-0bb9-df274a496b06@gmail.com> <20180718075637.GA10279@amd>
 <913151e4-c19f-9a22-697c-52a9fb48cb32@gmail.com> <0e0cd8f7-dc73-6733-65f2-9a14506b0f0e@gmail.com>
 <20180718221717.GA5451@amd> <20180719202005.GA7763@amd> <CAMz4kuKGcnDqyF29vGDqjRDMWmmk=c=QVQExYrx_Ymomm3qh+g@mail.gmail.com>
 <20180724114147.GA26036@amd> <CAMz4kuKbjUDvqyM3rovRmUpeSabNL6yHX1HpFUYD0pc9d4PNMg@mail.gmail.com>
 <20180727083605.GA20233@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180727083605.GA20233@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, David Lechner <david@lechnology.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 27 July 2018 at 16:36, Pavel Machek <pavel@ucw.cz> wrote:
> Hi!
>
>> > This should be a bit better. I attempted to compile it with your
>> > driver, but whether it works is an open question.
>>
>> Sorry for late reply. I've compiled and tested this version on my
>> platform, the hardware pattern can work with one small fix as below.
>>
>>  if (led_cdev->pattern_set && !led_cdev->pattern_set(led_cdev,
>> data->steps, data->nsteps)) {
>>         return;
>>  }
>>
>> But I saw there are lots coding style issues and something can be
>> improved in this patch, so will you send out one clean patch (I will
>> help to test the hardware pattern support)? Or I can help to improve
>> this code and try to upstream it again?
>
> If you could do the upstreaming, that would be great.

OK, I will improve the code and test the software/hardware pattern,
and upstream it again with keeping the original authorization.

> I tried to get hardware accelerated LED to work on N900, but that
> hardware is rather complex, so it would take me some time...

-- 
Baolin Wang
Best Regards
