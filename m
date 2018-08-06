From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v4 1/2] leds: core: Introduce LED pattern trigger
Date: Mon, 6 Aug 2018 15:33:12 +0800
Message-ID: <CAMz4kuKdtFDfvc4Lrx6yG5yu=qYRPj8MS5phxcLBkdKAPwXZyQ@mail.gmail.com>
References: <c43374283744539702023053c896efe3c73b7833.1533441631.git.baolin.wang@linaro.org>
 <3d7e8701-d92b-9f51-befa-a585b5957488@gmail.com> <CAMz4kuLSBLReVSo4zXf8b64kwCmRt2PS=JkeD2wJO41X-WmBQQ@mail.gmail.com>
 <20180806070958.GA5231@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180806070958.GA5231@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, rteysseyre@gmail.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 6 August 2018 at 15:09, Pavel Machek <pavel@ucw.cz> wrote:
> Hi!
>
>> > In current implementation this file on read returns the number
>> > of remaining repeat intervals. I'd add that to this description.
>>
>> I saw Pavel's comments that he did not suggest do this. So I will keep
>> the original description?
>
> If that is accepted, the code should return originally written number.

But I think it is more reasonable if user can know how many
repetitions were left. So for your hardware case, can we add
pattern_get() interface back to get the repetition number?

-- 
Baolin Wang
Best Regards
