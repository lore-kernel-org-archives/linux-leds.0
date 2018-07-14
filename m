From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 1/2] leds: core: Introduce generic pattern interface
Date: Sun, 15 Jul 2018 00:02:57 +0200
Message-ID: <00fa2693-9308-8d74-0124-04066a76c35a@gmail.com>
References: <1665b877dc2f886a90a00e3ca3b7425372d99b6e.1530248085.git.baolin.wang@linaro.org>
 <CAMz4kuJfPKykB6G-8C25mmMCfQgefv-Y=k2OQYZR_e0Tvg3guQ@mail.gmail.com>
 <8da1b769-8aa3-9698-467a-2e7b0707fecf@gmail.com>
 <CAMz4kuKZ6Z1h=yzFYJihEH1ARC5FKtDC6RLz0u8SmaekOZ=utw@mail.gmail.com>
 <20180714212033.GA31950@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180714212033.GA31950@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Baolin Wang <baolin.wang@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 07/14/2018 11:20 PM, Pavel Machek wrote:
> Hi!
> 
>>> It also drew my attention to the issue of desired pattern sysfs
>>> interface semantics on uninitialized pattern. In your implementation
>>> user seems to be unable to determine if the pattern is activated
>>> or not. We should define the semantics for this use case and
>>> describe it in the documentation. Possibly pattern could
>>> return alone new line character then.
> 
> Let me take a step back: we have triggers.. like LED blinking.
> 
> How is that going to interact with patterns? We probably want the
> patterns to be ignored in that case...?
> 
> Which suggest to me that we should treat patterns as a trigger. I
> believe we do something similar with blinking already.
> 
> Then it is easy to determine if pattern is active, and pattern
> vs. trigger issue is solved automatically.

I'm all for it. I proposed this approach during the previous
discussions related to possible pattern interface implementations,
but you seemed not to be so enthusiastic in [0].

[0] https://lkml.org/lkml/2017/4/7/350

-- 
Best regards,
Jacek Anaszewski
