From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v3 6/7] arm64: dts: xilinx: ultra96: Standardize LED
 labels and triggers
Date: Fri, 21 Dec 2018 07:50:29 +0100
Message-ID: <9f4f05cb-f326-a4e3-e306-cfbf64b629b4@xilinx.com>
References: <20181029094245.7886-1-manivannan.sadhasivam@linaro.org>
 <20181029094245.7886-7-manivannan.sadhasivam@linaro.org>
 <20181221023708.GC3233@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181221023708.GC3233@Mani-XPS-13-9360>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, michal.simek@xilinx.com, Rob Herring <robh+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, linus.walleij@linaro.org, koen.kooi@linaro.org, nicolas.dechesne@linaro.org
List-Id: linux-leds@vger.kernel.org

On 21. 12. 18 3:37, Manivannan Sadhasivam wrote:
> On Mon, Oct 29, 2018 at 03:12:44PM +0530, Manivannan Sadhasivam wrote:
>> For all 96Boards, the following standard is used for onboard LEDs.
>>
>> green:user1  default-trigger: heartbeat
>> green:user2  default-trigger: mmc0/disk-activity(onboard-storage)
>> green:user3  default-trigger: mmc1 (SD-card)
>> green:user4  default-trigger: none, panic-indicator
>> yellow:wlan  default-trigger: phy0tx
>> blue:bt      default-trigger: hci0-power
>>
>> So lets adopt the same for Ultra96, which is one of the 96Boards
>> CE and AI platform. Since the WLAN and BT LEDs are hardwired onboard,
>> consolidate only User LEDs.
>>
> 
> Hello,
> 
> Any update on this patch?

I am still waiting for reaction from Rob.
We are keep trying to keep backward compatibility and this patch is
breaking it that's why I want to know DT guys reaction on this change.

Thanks,
Michal
