From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: apq8016-sbc: Standardize LED labels
Date: Tue, 5 Feb 2019 20:00:43 +0100
Message-ID: <CAP71WjzWiCg-NXDnh58N-5O7kvNj+DDndSK04DeoPxFE2L8W0g@mail.gmail.com>
References: <20181029094245.7886-1-manivannan.sadhasivam@linaro.org>
 <20181029094245.7886-8-manivannan.sadhasivam@linaro.org> <20181221023554.GB3233@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181221023554.GB3233@Mani-XPS-13-9360>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>, linux-rockchip@lists.infradead.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-soc@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Koen Kooi <koen.kooi@linaro.org>
List-Id: linux-leds@vger.kernel.org

Hey Mani,

thanks for sending this out, it should have been just like that in the
first place ;)

On Fri, Dec 21, 2018 at 3:36 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Mon, Oct 29, 2018 at 03:12:45PM +0530, Manivannan Sadhasivam wrote:
> > For all 96Boards, the following standard is used for onboard LEDs.
> >
> > green:user1  default-trigger: heartbeat
> > green:user2  default-trigger: mmc0/disk-activity(onboard-storage)
> > green:user3  default-trigger: mmc1 (SD-card)
> > green:user4  default-trigger: none, panic-indicator
> > yellow:wlan  default-trigger: phy0tx
> > blue:bt      default-trigger: hci0-power
> >
> > So lets adopt the same for APQ8016 SBC (Dragonboard410c), which is
> > one of the 96Boards CE platform.
> >
>
> Hello,
>
> Any update on this patch?

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

>
> Regards,
> Mani
>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Acked-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > index 46feedf7c989..35f95154316b 100644
> > --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > @@ -300,28 +300,28 @@
> >                       compatible = "gpio-leds";
> >
> >                       led@1 {
> > -                             label = "apq8016-sbc:green:user1";
> > +                             label = "green:user1";
> >                               gpios = <&msmgpio 21 GPIO_ACTIVE_HIGH>;
> >                               linux,default-trigger = "heartbeat";
> >                               default-state = "off";
> >                       };
> >
> >                       led@2 {
> > -                             label = "apq8016-sbc:green:user2";
> > +                             label = "green:user2";
> >                               gpios = <&msmgpio 120 GPIO_ACTIVE_HIGH>;
> >                               linux,default-trigger = "mmc0";
> >                               default-state = "off";
> >                       };
> >
> >                       led@3 {
> > -                             label = "apq8016-sbc:green:user3";
> > +                             label = "green:user3";
> >                               gpios = <&pm8916_gpios 1 GPIO_ACTIVE_HIGH>;
> >                               linux,default-trigger = "mmc1";
> >                               default-state = "off";
> >                       };
> >
> >                       led@4 {
> > -                             label = "apq8016-sbc:green:user4";
> > +                             label = "green:user4";
> >                               gpios = <&pm8916_gpios 2 GPIO_ACTIVE_HIGH>;
> >                               linux,default-trigger = "none";
> >                               panic-indicator;
> > @@ -329,14 +329,14 @@
> >                       };
> >
> >                       led@5 {
> > -                             label = "apq8016-sbc:yellow:wlan";
> > +                             label = "yellow:wlan";
> >                               gpios = <&pm8916_mpps 2 GPIO_ACTIVE_HIGH>;
> >                               linux,default-trigger = "phy0tx";
> >                               default-state = "off";
> >                       };
> >
> >                       led@6 {
> > -                             label = "apq8016-sbc:blue:bt";
> > +                             label = "blue:bt";
> >                               gpios = <&pm8916_mpps 3 GPIO_ACTIVE_HIGH>;
> >                               linux,default-trigger = "bluetooth-power";
> >                               default-state = "off";
> > --
> > 2.17.1
> >
