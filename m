From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v5 1/2] leds: core: Introduce generic pattern interface
Date: Mon, 16 Jul 2018 11:51:01 -0500
Message-ID: <6ecb22d5-fac4-dbe9-87e7-196d87d6d06f@lechnology.com>
References: <05c235df7bbcc4b898e7b263bf38338d9c822005.1531711385.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <05c235df7bbcc4b898e7b263bf38338d9c822005.1531711385.git.baolin.wang@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: bjorn.andersson@linaro.org, broonie@kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 07/16/2018 06:10 AM, Baolin Wang wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Some LED controllers have support for autonomously controlling
> brightness over time, according to some preprogrammed pattern or
> function.
> 
> This adds a new optional operator that LED class drivers can implement
> if they support such functionality as well as a new device attribute to
> configure the pattern for a given LED.
> 

Hmm... I was hoping that this would be a generic pattern trigger that
could be used by any LED (e.g. gpio LEDs), not just LEDs with hardware
support. I guess I cannot really test this after all.

I think it looks good for your use case though.
