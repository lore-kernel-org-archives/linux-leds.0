From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 0/7] Standardize onboard LED support for 96Boards
Date: Wed, 31 Oct 2018 22:17:29 +0100
Message-ID: <CACRpkdarkLuErC_F4ALqOB5Wuf7TnDXmWZVKvfR7iGvOy=j++g@mail.gmail.com>
References: <20181029094245.7886-1-manivannan.sadhasivam@linaro.org>
 <CACRpkdYThcGjdV9Ezs4qMr8K6_jH40SDUgt0Tps8d+_4sSESyg@mail.gmail.com> <CAHTX3dJTXtuA0i-ffPjoiWuxEcF_5JY55VJtWd9zxW4HxK1K3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHTX3dJTXtuA0i-ffPjoiWuxEcF_5JY55VJtWd9zxW4HxK1K3w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <monstr@monstr.eu>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, Xu Wei <xuwei5@hisilicon.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Koen Kooi <koen.kooi@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Pavel Machek <pavel@ucw.cz>, Andy Gross <andy.gross@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>
List-Id: linux-leds@vger.kernel.org

On Wed, Oct 31, 2018 at 4:47 PM Michal Simek <monstr@monstr.eu> wrote:

> No doubt about it that this is good. If this is there from day 1 all will be good.
> I am just saying that we are all the time
> saying that we shouldn't break userspace. Right now if there is single application
> which uses existing names we are breaking it.

Yeah that's the problem, the approach is usually that if a tree falls
in the forest and noone is there to hear it, then it doesn't make a
sound.

But we can't assume someone is there as the safe default either.

I'd say apply it and see what happens, people are supposed to test.

Yours,
Linus Walleij
