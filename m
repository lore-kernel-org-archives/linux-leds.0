From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v3 1/2] leds: core: Introduce generic pattern interface
Date: Wed, 18 Jul 2018 19:32:01 +0800
Message-ID: <CAMz4kuJa=s19q7wQFQT1giUe0AN4hpux4PG2koUcnE7q_x7LCQ@mail.gmail.com>
References: <CAMz4kuJfPKykB6G-8C25mmMCfQgefv-Y=k2OQYZR_e0Tvg3guQ@mail.gmail.com>
 <8da1b769-8aa3-9698-467a-2e7b0707fecf@gmail.com> <CAMz4kuKZ6Z1h=yzFYJihEH1ARC5FKtDC6RLz0u8SmaekOZ=utw@mail.gmail.com>
 <20180714212033.GA31950@amd> <00fa2693-9308-8d74-0124-04066a76c35a@gmail.com>
 <20180714222924.GA2776@amd> <20180714223907.GB2776@amd> <1138f834-e805-6076-bb5b-aa1fdc1f2606@gmail.com>
 <2c3a8911-150a-9b25-2a66-a9432047f96b@lechnology.com> <68996338-a902-2b57-0bb9-df274a496b06@gmail.com>
 <20180718075637.GA10279@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180718075637.GA10279@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, David Lechner <david@lechnology.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 18 July 2018 at 15:56, Pavel Machek <pavel@ucw.cz> wrote:
> Hi!
>
>> >>>>I believe I meant "changing patterns from kernel in response to events
>> >>>>is probably overkill"... or something like that.
>> >>>
>> >>>Anyway -- to clean up the confusion -- I'd like to see
>> >>>
>> >>>echo pattern > trigger
>> >>>echo "1 2 3 4 5 6 7 8" > somewhere
>> >>
>> >>s/somewhere/pattern/
>> >>
>> >>pattern trigger should create "pattern" file similarly how ledtrig-timer
>> >>creates delay_{on|off} files.
>
> Yes, that sounds reasonable. v5 still says
>
> +               Writing non-empty string to this file will activate the pattern,
> +               and empty string will disable the pattern.
>
> I'd deactivate the pattern by simply writing something else to the
> trigger file.

For the case we met in patch 2, it is not related with trigger things.
We just set some series of tuples including brightness and duration
(ms) to the hardware to enable the breath mode of the LED, we did not
trigger anything. So it is weird to write something to trigger file to
deactive the pattern.

-- 
Baolin Wang
Best Regards
