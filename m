From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Thinkpad ACPI led -- it keeps blinking
Date: Fri, 26 Apr 2019 20:22:27 +0200
Message-ID: <dc675327-4152-ab5c-c566-8417d6bfa878@gmail.com>
References: <20190426123513.GA18172@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20190426123513.GA18172@amd>
Content-Language: en-US
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 4/26/19 2:35 PM, Pavel Machek wrote:
> Hi!
> 
> Something is wrong with blinking on thinkpad
> 
> pavel@amd:~/bt/blee$ cat /sys/class/leds/tpacpi\:\:power/trigger
> [none] bluetooth-power rfkill-any rfkill-none kbd-scrolllock
> kbd-numlock kbd-capslock kbd-kanalock kbd-shiftlock kbd-altgrlock
> kbd-ctrllock kbd-altlock kbd-shiftllock kbd-shiftrlock kbd-ctrlllock
> kbd-ctrlrlock AC-online BAT0-charging-or-full BAT0-charging BAT0-full
> BAT0-charging-blink-full-solid rfkill0 phy0rx phy0tx phy0assoc
> phy0radio phy0tpt mmc0 timer heartbeat audio-mute audio-micmute
> rfkill1 hci0-power rfkill5
> pavel@amd:~/bt/blee$ echo 1 >
> /sys/class/leds/tpacpi\:\:power/brightness
> pavel@amd:~/bt/blee$ echo 0 >
> /sys/class/leds/tpacpi\:\:power/brightness
> pavel@amd:~/bt/blee$
> 
> Trigger indicates "none" but it keeps blinking, until I echo 0 >
> brightness to stop it. I have python script to trigger this
> behaviour... it seems to work from shell.
> 
> It behaves strangely. If I ask for blinking twice, it stops blinking
> on second request.
> 
> pavel@amd:~/bt/blee$ echo timer >
> /sys/class/leds/tpacpi\:\:power/trigger
> pavel@amd:~/bt/blee$ echo timer >
> /sys/class/leds/tpacpi\:\:power/trigger
> 
> echoing none fixes it.
> 
> Kernel 5.1.0-rc1 + some unrelated bits.

Maybe this is manifestation of the possible problem we still
have in the LED core.

I once proposed a patch [0]. You could try if it changes
something in your case.

[0] https://marc.info/?l=linux-kernel&m=151622365715313&w=2

-- 
Best regards,
Jacek Anaszewski
