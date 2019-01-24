From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 6/7] arm64: dts: xilinx: ultra96: Standardize LED
 labels and triggers
Date: Thu, 24 Jan 2019 10:49:30 -0600
Message-ID: <CAL_Jsq+zfV66EZHX7psh2=r-=wDrmLLcr5PWtSzuKRNOdMR-Dw@mail.gmail.com>
References: <20181029094245.7886-1-manivannan.sadhasivam@linaro.org>
 <20181029094245.7886-7-manivannan.sadhasivam@linaro.org> <20181221023708.GC3233@Mani-XPS-13-9360>
 <9f4f05cb-f326-a4e3-e306-cfbf64b629b4@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9f4f05cb-f326-a4e3-e306-cfbf64b629b4@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, koen.kooi@linaro.org, Nicolas Dechesne <nicolas.dechesne@linaro.org>
List-Id: linux-leds@vger.kernel.org

On Fri, Dec 21, 2018 at 12:51 AM Michal Simek <michal.simek@xilinx.com> wrote:
>
> On 21. 12. 18 3:37, Manivannan Sadhasivam wrote:
> > On Mon, Oct 29, 2018 at 03:12:44PM +0530, Manivannan Sadhasivam wrote:
> >> For all 96Boards, the following standard is used for onboard LEDs.
> >>
> >> green:user1  default-trigger: heartbeat
> >> green:user2  default-trigger: mmc0/disk-activity(onboard-storage)
> >> green:user3  default-trigger: mmc1 (SD-card)
> >> green:user4  default-trigger: none, panic-indicator
> >> yellow:wlan  default-trigger: phy0tx
> >> blue:bt      default-trigger: hci0-power
> >>
> >> So lets adopt the same for Ultra96, which is one of the 96Boards
> >> CE and AI platform. Since the WLAN and BT LEDs are hardwired onboard,
> >> consolidate only User LEDs.
> >>
> >
> > Hello,
> >
> > Any update on this patch?
>
> I am still waiting for reaction from Rob.
> We are keep trying to keep backward compatibility and this patch is
> breaking it that's why I want to know DT guys reaction on this change.

dts changes and backwards compatibility are ultimately up to the
platform maintainers. Your users can yell at you if they care. I only
ask that changes that break compatibility are documented as doing so.

Personally, I'm in favor of this change. I'd rather seem uniformity
across boards and this is just a dev board and LED functions won't
affect booting.

Rob
