From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH v3 0/7] Standardize onboard LED support for 96Boards
Date: Thu, 29 Nov 2018 15:42:29 +0000
Message-ID: <5C0008E5.5080401@hisilicon.com>
References: <20181029094245.7886-1-manivannan.sadhasivam@linaro.org>
 <CACRpkdYThcGjdV9Ezs4qMr8K6_jH40SDUgt0Tps8d+_4sSESyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYThcGjdV9Ezs4qMr8K6_jH40SDUgt0Tps8d+_4sSESyg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh@kernel.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, ezequiel@collabora.com, Michal Simek <michal.simek@xilinx.com>, Pavel Machek <pavel@ucw.cz>, Andy Gross <andy.gross@linaro.org>, linux-leds@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-arm-msm@vger.kernel.org, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Koen Kooi <koen.kooi@linaro.org>, Nicolas Dechesne <nicolas.dechesne>
List-Id: linux-leds@vger.kernel.org

Hi Manivannan,

On 2018/10/31 13:38, Linus Walleij wrote:
> On Mon, Oct 29, 2018 at 10:43 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> 
>> This patchset standardizes the onboard LEDs on 96Boards by maintaining
>> common labels and triggers as below:
>>
>> green:user1  default-trigger: heartbeat
>> green:user2  default-trigger: mmc0/disk-activity (onboard-storage)
>> green:user3  default-trigger: mmc1 (SD card)
>> green:user4  default-trigger: none, panic-indicator
>> yellow:wlan  default-trigger: phy0tx
>> blue:bt      default-trigger: hci0-power
>>
>> This standardization is required to provide a common behaviour of LEDs
>> across all mainline supported 96Boards and also making it easier to
>> control it using an userspace library like MRAA.
>>
>> For Rock960 and Ficus boards, the LED support is added in this patchset.
>> Rest of the boards are converted to adopt the standard.
>>
>> Note: Since there is no UFS trigger available for now, user2 LED trigger
>> is set to none on HiKey960.
> 
> This series:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> It makes a lot of sense to try to unify the userspace ABI so we get
> some kind of order here instead of trying to counteract it with
> per-device kludges in userspace. It definately makes things better!
> 
> Yours,
> Linus Walleij
> 
> .
> 

Applied hisilicon part(patch 3,4 and 5) to the hisilicon soc dt tree.
Thanks!

Best Regards,
Wei
