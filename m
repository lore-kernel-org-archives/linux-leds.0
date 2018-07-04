From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2] leds: ledtrig-morse: send out morse code
Date: Wed, 4 Jul 2018 22:36:33 +0200
Message-ID: <b10a8282-0297-8cd6-5d29-fb4adcf72366@gmail.com>
References: <20180703155328.GA18299@arbeit> <20180704065305.GA23509@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180704065305.GA23509@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Andreas Klinger <ak@it-klinger.de>
Cc: ben.whitten@gmail.com, geert+renesas@glider.be, w@1wt.eu, pombredanne@nexb.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 07/04/2018 08:53 AM, Pavel Machek wrote:
> On Tue 2018-07-03 17:53:28, Andreas Klinger wrote:
>> Send out a morse code by using LEDs.
>>
>> This is useful especially on embedded systems without displays to tell the
>> user about error conditions and status information.
>>
>> The trigger will be called "morse"
>>
>> The string to be send is written into the file morse_string and sent out
>> with a workqueue. Supported are letters and digits.
>>
>> With the file dot_unit the minimal time unit can be adjusted in
>> milliseconds.
>>
>> Also add documentation for the morse led trigger
>>
>> Thanks to Greg and Geert for suggesting improvements
>>
>> Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> 
> As I stated before, I don't think morse encoder belongs in kernel.
> 
> LED pattern trigger should be merged, instead.

We've already agreed in [0] upon pattern sysfs file, and related
patch set [1] is just to be merged.

[0] https://lkml.org/lkml/2018/5/12/142
[1] https://patchwork.kernel.org/patch/10495595/

-- 
Best regards,
Jacek Anaszewski
